package com.blog.controller;

import com.blog.entity.Blog;
import com.blog.entity.Comment;
import com.blog.lucene.BlogIndex;
import com.blog.service.BlogService;
import com.blog.service.CommentService;
import com.blog.util.PageUtil;
import com.blog.util.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
@Controller
@RequestMapping("/blog")
public class BlogController {

    @Resource
    private BlogService blogService;
    @Resource
    private CommentService commentService;

    private BlogIndex blogIndex = new BlogIndex();

    //请求博客详细信息
    @RequestMapping("/articles/{id}")
    public ModelAndView details(@PathVariable Integer id, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        Blog blog = blogService.findById(id);

        //获取关键字
        String keywords = blog.getKeyword();
        if(!StringUtil.isEmpty(keywords)){
            String[] strArray = keywords.split(" ");
            List<String> keywordList = StringUtil.filterWhite(Arrays.asList(strArray));
            modelAndView.addObject("keywords",keywordList);
        }else {
            modelAndView.addObject("keywords",null);
        }

        modelAndView.addObject("blog",blog);
        blog.setClickHit(blog.getClickHit() + 1);
        blogService.update(blog);

        //查询评论信息
        Map<String,Object> map = new HashMap<>();
        map.put("blogId",blog.getId());
        map.put("state",1);
        //获取所有提交审核通过的评论
        List<Comment> commentList = commentService.getCommentData(map);

        modelAndView.addObject("commonList",commentList);
        modelAndView.addObject("commonPage","foreground/blog/blogDetail.jsp");
        modelAndView.addObject("title",blog.getTitle() + "- 某某的博客");

        //存入上一篇和下一篇
        modelAndView.addObject("pageCode", PageUtil.getPrevAndNextPageCode(blogService.getPrevBlog(id),
                blogService.getNextBlog(id),request.getServletContext().getContextPath()));

        modelAndView.setViewName("mainTemp");
        return modelAndView;
    }

    //根据关键字查询博客信息
    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(value = "q", required = false) String q,
                               @RequestParam(value = "page", required = false) String page,
                               HttpServletRequest request) throws Exception{
        int pageSize = 10;
        ModelAndView modelAndView = new ModelAndView();
        List<Blog> blogIndexList = blogIndex.searchBlog(q);
        if(page == null){   //page为空表示第一次搜索
            page = "1";
        }
        int fromIndex = (Integer.parseInt(page) - 1) * pageSize;    //开始索引
        int toIndex = blogIndexList.size() >= Integer.parseInt(page) * pageSize ? Integer.parseInt(page) * pageSize
                :blogIndexList.size();
        modelAndView.addObject("blogIndexList", blogIndexList.subList(fromIndex, toIndex));
        modelAndView.addObject("pageCode", PageUtil.getUpAndDownPageCode(
                Integer.parseInt(page), blogIndexList.size(), q, pageSize,
                request.getServletContext().getContextPath()));
        modelAndView.addObject("q", q); // 用于数据的回显
        modelAndView.addObject("resultTotal", blogIndexList.size()); // 查询到的总记录数
        modelAndView.addObject("commonPage", "foreground/blog/searchResult.jsp");
        modelAndView.addObject("title", "搜索'" + q + "'的结果 - 某某的博客");
        modelAndView.setViewName("mainTemp");
        return modelAndView;
    }
}
