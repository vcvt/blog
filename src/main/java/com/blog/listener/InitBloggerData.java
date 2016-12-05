package com.blog.listener;

import com.blog.entity.Blogger;
import com.blog.entity.Link;
import com.blog.service.BloggerService;
import com.blog.service.LinkService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

/**
 * Created by Administrator
 */
@Component
public class InitBloggerData implements ServletContextListener{

    private static ApplicationContext applicationContext; //必须为静态的
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        applicationContext = (ApplicationContext)sce.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        System.out.println(applicationContext);
        //先获取servlet上下文,即application域
        ServletContext application = sce.getServletContext();

        //根据Spring的上下文获取bloggerService这个bean
        BloggerService bloggerService = (BloggerService)applicationContext.getBean("bloggerService");
        //获取博主信息
        Blogger blogger = bloggerService.getBloggerData();
        //由于密码也获取到了，比较敏感，我们不需要这个，所以把密码清空
        blogger.setPassword(null);
        //将博主信息存入application域中
        application.setAttribute("blogger",blogger);

        LinkService linkService = (LinkService)applicationContext.getBean("linkService");
        List<Link> linkList = linkService.getLinkData();
        application.setAttribute("linkList",linkList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

}
