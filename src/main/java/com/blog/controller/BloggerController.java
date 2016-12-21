package com.blog.controller;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.util.CryptographyUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 博主Controller层，前台部分，不需要认证
 * Created by Administrator
 */
@Controller
@RequestMapping("/blogger")
public class BloggerController {

    @Resource
    private BloggerService bloggerService;

    @RequestMapping("/login")
    public String login(Blogger blogger, HttpServletRequest request){
        Subject subject = SecurityUtils.getSubject();   //获取当前登录主体
        String newPassword = CryptographyUtil.md5(blogger.getPassword(),"vcvt");

        //将用户信息封装发到token中，等和数据库中查询的结果进行匹配
        UsernamePasswordToken token = new UsernamePasswordToken(blogger.getUsername(),newPassword);
        try {
            subject.login(token);   //会调用MyRealm中的doGetAuthenticationInfo方法进行验证
            //如果验证成功，则登录到后台博主管理主页
            return "redirect:/admin/main.jsp";
        }catch (AuthenticationException e){
            e.printStackTrace();
            request.setAttribute("blogger",blogger);
            request.setAttribute("errorInfo","用户名或密码错误");
            return "login";
        }
    }

    @RequestMapping("/aboutme")
    public ModelAndView aboutMe(){
        ModelAndView modelAndView = new ModelAndView();
        Blogger blogger = bloggerService.getBloggerData();
        modelAndView.addObject("blogger",blogger);
        modelAndView.addObject("commonPage","/foreground/blogger/bloggerInfo.jsp");
        modelAndView.addObject("title","关于博主--某某的博客");
        modelAndView.setViewName("mainTemp");
        return modelAndView;
    }

    @RequestMapping("/myalbum")
    public ModelAndView myAlbum() {
        ModelAndView modelAndView = new ModelAndView();
        //要写一个相册的service获取相册
        //要建一个相册表
        //....
        modelAndView.addObject("commonPage", "/foreground/blogger/myAlbum.jsp");
        modelAndView.setViewName("mainTemp");
        return modelAndView;
    }

    @RequestMapping("/resource")
    public ModelAndView resource() {
        ModelAndView modelAndView = new ModelAndView();
        //
        //....
        modelAndView.addObject("commonPage", "/foreground/blogger/resource.jsp");
        modelAndView.setViewName("mainTemp");
        return modelAndView;
    }
}
