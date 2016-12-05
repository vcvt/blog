package com.blog.dao;

import com.blog.entity.Link;

import java.util.List;

/**
 * Created by Administrator
 */
public interface LinkDao {
    //获取友情链接
    List<Link> getLinkData();
}
