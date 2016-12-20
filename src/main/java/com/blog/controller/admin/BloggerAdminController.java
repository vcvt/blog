package com.blog.controller.admin;

import com.blog.entity.Blogger;
import com.blog.service.BloggerService;
import com.blog.util.CryptographyUtil;
import com.blog.util.DateUtil;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public @ResponseBody Object findBlogger(HttpServletResponse response) throws Exception {
        Blogger blogger = bloggerService.getBloggerData();
        JSONObject jsonObject = JSONObject.fromObject(blogger);
        return jsonObject;
    }

    //修改博主信息
    @RequestMapping("/save")
    public @ResponseBody Object save(
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
        return result;
    }

    //修改博主密码
    @RequestMapping("/modifyPassword")
    public @ResponseBody Object modifyPassword(
            @RequestParam String password,
            HttpServletResponse response) throws Exception{
        Blogger blogger = new Blogger();
        blogger.setPassword(CryptographyUtil.md5(password,"vcvt"));
        int resultTotal = bloggerService.updateBlogger(blogger);
        System.out.println("resultTotal is :" + resultTotal);
        JSONObject result = new JSONObject();
        if(resultTotal > 0){
            result.put("success",true);
        }else {
            result.put("success",false);
        }
        return result;
    }
    //退出
    @RequestMapping("/logout")
    public String logout() throws Exception{
        SecurityUtils.getSubject().logout();
        return "redirect:/login.jsp";
    }
}
