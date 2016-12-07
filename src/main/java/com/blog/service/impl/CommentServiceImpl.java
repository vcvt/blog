package com.blog.service.impl;

import com.blog.dao.CommentDao;
import com.blog.entity.Comment;
import com.blog.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService{

    @Resource
    private CommentDao commentDao;
    @Override
    public List<Comment> getCommentData(Map<String, Object> map) {
        return commentDao.getCommentData(map);
    }

    @Override
    public Integer addComment(Comment comment) {
        return commentDao.addComment(comment);
    }

    @Override
    public Integer getTotal(Map<String, Object> map) {
        return commentDao.getTotal(map);
    }

    @Override
    public Integer update(Comment comment) {
        return commentDao.update(comment);
    }

    @Override
    public Integer deleteComment(Integer id) {
        return commentDao.deleteComment(id);
    }

    @Override
    public Integer deleteCommentByBlogId(Integer blogId) {
        return commentDao.deleteCommentByBlogId(blogId);
    }
}
