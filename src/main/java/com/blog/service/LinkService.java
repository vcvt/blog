package com.blog.service;

import com.blog.entity.Link;

import java.util.List;

/**
 * Created by Administrator
 */
public interface LinkService {
    //获取友情链接
    List<Link> getLinkData();
}
