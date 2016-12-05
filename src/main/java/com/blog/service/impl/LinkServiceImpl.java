package com.blog.service.impl;

import com.blog.dao.LinkDao;
import com.blog.entity.Link;
import com.blog.service.LinkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
}
