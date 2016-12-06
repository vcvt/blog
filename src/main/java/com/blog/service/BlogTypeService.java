package com.blog.service;

import com.blog.entity.BlogType;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
public interface BlogTypeService {
    List<BlogType> getBlogTypeData();

    BlogType findById(int id);

    // 分页查询博客类别信息
    List<BlogType> listBlogType(Map<String,Object> map);

    int getTotal(Map<String,Object> map);

    int addBlogType(BlogType blogType);

    int updateBlogType(BlogType blogType);

    int deleteBlogType(int id);
}
