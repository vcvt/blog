package com.blog.dao;

import com.blog.entity.Blog;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
public  interface BlogDao {
    List<Blog> getBlogData();

    // 分页查询博客
    List<Blog> listBlog(Map<String, Object> map);

    // 获取总记录数
    int getTotal(Map<String, Object> map);

    // 根据id获取博客
    Blog findById(Integer id);

    // 更新博客信息
    Integer update(Blog blog);

    // 获取上一篇博客
    Blog getPrevBlog(Integer id);

    // 获取下一篇一篇博客
    Blog getNextBlog(Integer id);

    // 添加博客
    Integer addBlog(Blog blog);

    // 删除博客信息
    Integer deleteBlog(Integer id);

    // 根据博客类型的id查询该类型下的博客数量
    Integer getBlogByTypeId(Integer typeId);
}
