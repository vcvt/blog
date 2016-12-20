package com.blog.controller.admin;

import com.blog.entity.Link;
import com.blog.entity.PageBean;
import com.blog.service.LinkService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
@Controller
@RequestMapping("/admin/link")
public class LinkCommentController {
    @Resource
    private LinkService linkService;
    //分页查询友情链接
    @RequestMapping("/listLink")
    public @ResponseBody Object listLink(
            //required默认值为true
            @RequestParam(value = "page",required = false) String page,
            @RequestParam(value = "rows",required = false) String rows,
            HttpServletResponse response) throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<>();

        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());
        List<Link> linkList = linkService.listLinkData(map);
        int total = linkService.getTotal(map);

        JSONObject result = new JSONObject();
        JSONArray jsonArray = JSONArray.fromObject(linkList);
        result.put("rows", jsonArray);
        result.put("total", total);
        return result;
    }

    // 添加和更新友情链接
    @RequestMapping("/save")
    public @ResponseBody Object save(Link link, HttpServletResponse response)
            throws Exception {

        int resultTotal = 0; // 接收返回结果记录数
        if (link.getId() == null) { // 说明是第一次插入
            resultTotal = linkService.addLink(link);
        } else { // 有id表示修改
            resultTotal = linkService.updateLink(link);
        }

        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        return result;
    }

    // 友情链接信息删除
    @RequestMapping("/delete")
    public  @ResponseBody Object deleteLink(
            @RequestParam(value = "ids", required = false) String ids,
            HttpServletResponse response) throws Exception {

        String[] idsStr = ids.split(",");
        JSONObject result = new JSONObject();
        for (int i = 0; i < idsStr.length; i++) {
            int id = Integer.parseInt(idsStr[i]);
            linkService.deleteLink(id);
        }
        result.put("success", true);
        return result;
    }
}
