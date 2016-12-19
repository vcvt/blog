package com.blog.dao;

import com.blog.entity.Link;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
public interface LinkDao {
    //获取友情链接
    List<Link> getLinkData();
    // 分页获取友情链接
    List<Link> listLinkData(Map<String, Object> map);

    // 获取总记录数
    Integer getTotal(Map<String, Object> map);

    // 添加友情链接
    Integer addLink(Link link);

    // 更新友情链接
    Integer updateLink(Link link);

    // 删除友情链接
    Integer deleteLink(Integer id);
}
