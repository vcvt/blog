package com.blog.dao;

import com.blog.entity.Blogger;

/**
 * Created by Administrator
 */
public interface BloggerDao {

    //通过用户名查询用户
    Blogger getByUsername(String username);

    //获取博主信息
    Blogger getBloggerData();
}
