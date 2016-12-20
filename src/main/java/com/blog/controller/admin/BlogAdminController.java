package com.blog.controller.admin;

import com.blog.entity.Blog;
import com.blog.entity.PageBean;
import com.blog.lucene.BlogIndex;
import com.blog.service.BlogService;
import com.blog.service.CommentService;
import com.blog.util.DateJsonValueProcessor;
import com.blog.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
@Controller
@RequestMapping("/admin/blog")
public class BlogAdminController {
    @Resource
    private BlogService blogService;
    @Resource
    private CommentService commentService;

    private BlogIndex blogIndex = new BlogIndex();

    //添加和更新博客
    @RequestMapping("/save")
    public @ResponseBody Object save(Blog blog, HttpServletResponse response) throws Exception {
        int resultTotal = 0;    //接收返回结果记录数
        if(blog.getId() == null){
            //说明第一次插入
            resultTotal = blogService.addBlog(blog);
            blogIndex.addIndex(blog);   //添加博客的索引
        }else {
            //有Id表示修改
            resultTotal = blogService.update(blog);
            blogIndex.updateIndex(blog);
        }

       JSONObject result = new JSONObject();
        if(resultTotal > 0){
            result.put("success",true);
        }else {
            result.put("success",false);
        }
        return result;
    }

    //后台分页查询博客信息
    @RequestMapping("/listBlog")
    public @ResponseBody Object listBlog(
            @RequestParam(value = "page",required = false) String page,
            @RequestParam(value = "rows",required = false) String rows,
            Blog s_blog,
            HttpServletResponse response) throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<>();
        map.put("title", StringUtil.formatLike(s_blog.getTitle()));//模糊查询
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());
        List<Blog> blogList = blogService.listBlog(map);
        int total = blogService.getTotal(map);

        JSONObject result = new JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class,new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray = JSONArray.fromObject(blogList,jsonConfig);
        result.put("rows",jsonArray);
        result.put("total",total);
        return result;
    }

    //博客信息删除
    @RequestMapping("/delete")
    public @ResponseBody Object deleteBlog(
            @RequestParam(value = "ids",required = false) String ids,
            HttpServletResponse response) throws Exception{

        String[] idsStr = ids.split(",");
        for(int i = 0; i < idsStr.length; i++){
            int id = Integer.parseInt(idsStr[i]);
            commentService.deleteCommentByBlogId(id);
            blogService.deleteBlog(id);
            blogIndex.deleteIndex(idsStr[i]);
        }
        JSONObject result = new JSONObject();
        result.put("success", true);
        return result;
    }

    //通过Id获取博客实体
    @RequestMapping("/findById")
    public @ResponseBody Object findById(
            @RequestParam(value = "id",required = false) String id,
            HttpServletResponse response) throws Exception {

        Blog blog = blogService.findById(Integer.parseInt(id));
        JSONObject result = JSONObject.fromObject(blog);
        return result;
    }
}
