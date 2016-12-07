package com.blog.dao;

import com.blog.entity.BlogType;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
public interface BlogTypeDao {

    List<BlogType> getBlogTypeData();

    BlogType findById(Integer id);

    // 分页查询博客类别信息
    List<BlogType> listBlogType(Map<String,Object> map);

    Integer getTotal(Map<String,Object> map);

    Integer addBlogType(BlogType blogType);

    Integer updateBlogType(BlogType blogType);

    Integer deleteBlogType(Integer id);
}
