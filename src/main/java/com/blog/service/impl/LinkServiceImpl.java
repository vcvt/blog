package com.blog.service.impl;

import com.blog.dao.LinkDao;
import com.blog.entity.Link;
import com.blog.service.LinkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator
 */
@Service("linkService")
public class LinkServiceImpl implements LinkService{

    @Resource
    private LinkDao linkDao;

    @Override
    public List<Link> getLinkData() {
        return linkDao.getLinkData();
    }

    @Override
    public List<Link> listLinkData(Map<String, Object> map) {
        return linkDao.getLinkData();
    }

    @Override
    public Integer getTotal(Map<String, Object> map) {
        return linkDao.getTotal(map);
    }

    @Override
    public Integer addLink(Link link) {
        return linkDao.addLink(link);
    }

    @Override
    public Integer updateLink(Link link) {
        return linkDao.updateLink(link);
    }

    @Override
    public Integer deleteLink(Integer id) {
        return linkDao.deleteLink(id);
    }
}
