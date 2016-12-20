package com.blog.controller.admin;

import com.blog.entity.Blog;
import com.blog.entity.BlogType;
import com.blog.entity.Blogger;
import com.blog.entity.Link;
import com.blog.service.BlogService;
import com.blog.service.BlogTypeService;
import com.blog.service.BloggerService;
import com.blog.service.LinkService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator
 */
@Controller
@RequestMapping("/admin/system")
public class SystemAdminController {

    @Resource
    private BloggerService bloggerService;
    @Resource
    private LinkService linkService;
    @Resource
    private BlogTypeService blogTypeService;
    @Resource
    private BlogService blogService;

    //刷新系统缓存
    @RequestMapping("/refreshSystemCache")
    public @ResponseBody Object refreshSystemCache(
            HttpServletRequest request,
            HttpServletResponse response)throws Exception{
        //ServletContext application = RequestContextUtils.getWebApplicationContext(request).getServletContext();
        ServletContext application = request.getSession().getServletContext();

        // 获取博主信息
        Blogger blogger = bloggerService.getBloggerData();
        blogger.setPassword(null);
        application.setAttribute("blogger", blogger);

        // 获取友情链接信息
        List<Link> linkList = linkService.getLinkData();
        application.setAttribute("linkList", linkList);

        // 获取博客类别信息
        List<BlogType> blogTypeList = blogTypeService.getBlogTypeData();
        application.setAttribute("blogTypeList", blogTypeList);

        // 获取博客信息，按照时间分类的
        List<Blog> blogTimeList = blogService.getBlogData();
        application.setAttribute("blogTimeList", blogTimeList);

        JSONObject result = new JSONObject();
        result.put("success", true);
        return result;
    }

}
