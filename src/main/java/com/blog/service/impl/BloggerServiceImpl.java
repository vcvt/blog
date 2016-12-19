package com.blog.service.impl;

import com.blog.dao.BloggerDao;
import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator
 */
@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService{

    @Resource
    private BloggerDao bloggerDao;

    @Override
    public Blogger getByUsername(String username) {
        return bloggerDao.getByUsername(username);
    }

    @Override
    public Integer updateBlogger(Blogger blogger) {
        return bloggerDao.updateBlogger(blogger);
    }

    @Override
    public Blogger getBloggerData() {
        return bloggerDao.getBloggerData();
    }
}
