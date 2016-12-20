package com.blog.controller;

import com.blog.entity.Blog;
import com.blog.entity.Comment;
import com.blog.service.BlogService;
import com.blog.service.CommentService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Resource
    private CommentService commentService;

    @Resource
    private BlogService blogService;

    //添加或修改评论
    @RequestMapping("/save")
    public @ResponseBody Object save(
            Comment comment,
            @RequestParam String imageCode, //前台传来的验证码
            HttpServletRequest request,
            HttpServletResponse response,
            HttpSession session) throws Exception{
            String sRand = (String)session.getAttribute("sRand");//获取session中正确的验证码，验证码产生后会存到session中的
            JSONObject result = new JSONObject();
            int resultTotal = 0; //执行记录数
            if(!imageCode.equals(sRand)){
                result.put("success",false);
                result.put("errorInfo","验证码有误!");
            }else {
                String userIp = request.getRemoteAddr();//获取评论用户的ip
                comment.setUserIp(userIp);//将userIp设置进去
                if(comment.getId() == null) {
                    //没有Id表示添加
                    resultTotal = commentService.addComment(comment);
                    Blog blog = blogService.findById(comment.getBlog().getId());//更新一下博客的评论次数
                    blog.setReplyHit(blog.getReplyHit() + 1);
                    blogService.update(blog);
                }else {
                    //有Id表示修改
                }
            }
        if(resultTotal > 0){
            result.put("success",true);
        }
        return result;
    }
}
