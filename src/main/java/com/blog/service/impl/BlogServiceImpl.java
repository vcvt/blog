package com.blog.service.impl;

import com.blog.dao.BlogDao;
import com.blog.entity.Blog;
import com.blog.service.BlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService{

    @Resource
    private BlogDao blogDao;
    @Override
    public List<Blog> getBlogData() {
        return blogDao.getBlogData();
    }

    @Override
    public List<Blog> listBlog(Map<String, Object> map) {
        return blogDao.listBlog(map);
    }

    @Override
    public int getTotal(Map<String, Object> map) {
        return blogDao.getTotal(map);
    }

    @Override
    public Blog findById(Integer id) {
        return blogDao.findById(id);
    }

    @Override
    public Integer update(Blog blog) {
        return blogDao.update(blog);
    }

    @Override
    public Blog getPrevBlog(Integer id) {
        return blogDao.getPrevBlog(id);
    }

    @Override
    public Blog getNextBlog(Integer id) {
        return blogDao.getNextBlog(id);
    }

    @Override
    public Integer addBlog(Blog blog) {
        return blogDao.addBlog(blog);
    }

    @Override
    public Integer deleteBlog(Integer id) {
        return blogDao.deleteBlog(id);
    }

    @Override
    public Integer getBlogByTypeId(Integer typeId) {
        return blogDao.getBlogByTypeId(typeId);
    }
}
