package com.blog.service.impl;

import com.blog.dao.BlogTypeDao;
import com.blog.entity.BlogType;
import com.blog.service.BlogTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {

    @Resource
    private BlogTypeDao blogTypeDao;
    @Override
    public List<BlogType> getBlogTypeData() {
        return blogTypeDao.getBlogTypeData();
    }

    @Override
    public BlogType findById(int id) {
        return blogTypeDao.findById(id);
    }

    @Override
    public List<BlogType> listBlogType(Map<String, Object> map) {
        return blogTypeDao.listBlogType(map);
    }

    @Override
    public int getTotal(Map<String, Object> map) {
        return blogTypeDao.getTotal(map);
    }

    @Override
    public int addBlogType(BlogType blogType) {
        return blogTypeDao.addBlogType(blogType);
    }

    @Override
    public int updateBlogType(BlogType blogType) {
        return blogTypeDao.updateBlogType(blogType);
    }

    @Override
    public int deleteBlogType(int id) {
        return blogTypeDao.deleteBlogType(id);
    }
}
