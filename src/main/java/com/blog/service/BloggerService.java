package com.blog.service;

import com.blog.entity.Blogger;

/**
 * Created by Administrator
 */
public interface BloggerService {
    //通过用户名查询用户
    Blogger getByUsername(String username);

    //获取博主信息
    Blogger getBloggerData();

    // 更新博主个人信息
    public Integer updateBlogger(Blogger blogger);
}
