package com.blog.controller.admin;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.util.DateUtil;
import com.blog.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

/**
 * Created by Administrator
 */
@Controller
@RequestMapping("/admin/blogger")
public class BloggerAdminController {

    @Resource
    private BloggerService bloggerService;

    //查询博主信息
    @RequestMapping("/findBlogger")
    public String findBlogger(HttpServletResponse response) throws Exception {
        Blogger blogger = bloggerService.getBloggerData();
        JSONObject jsonObject = JSONObject.fromObject(blogger);
        ResponseUtil.write(response, jsonObject);
        return null;
    }

    //修改博主信息
    @RequestMapping("/save")
    public String save(
            @RequestParam(value = "imageFile")MultipartFile imageFile,
            Blogger blogger,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception{
        if(!imageFile.isEmpty()){
            //如果用户有传过照片就更新
            String filePath = request.getServletContext().getRealPath("/"); //获取服务器根路径
            String imageName = DateUtil.getCurrentDateStr() + "." + imageFile.getOriginalFilename().split("\\.")[1];
            imageFile.transferTo(new File(filePath + "static/userImages/" + imageName));
            blogger.setImagename(imageName);
        }
        int resultTotal = bloggerService.updateBlogger(blogger);
        JSONObject result = new JSONObject();
        if(resultTotal > 0){
            result.put("success",true);
        }else {
            result.put("success",false);
        }
        ResponseUtil.write(response,result);
        return null;
    }

    //退出
    @RequestMapping("/logout")
    public String logout() throws Exception{
        SecurityUtils.getSubject().logout();
        return "redirect:/login.jsp";
    }
}
