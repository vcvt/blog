package com.blog.entity;

/**
 * Created by Administrator
 * 分页实体类
 */
public class PageBean {

    private Integer page;   //第几页
    private Integer pageSize;   //每页记录数
    private Integer start;  //起始页

    public PageBean(Integer page,Integer pageSize){
        super();
        this.page = page;
        this.pageSize = pageSize;
    }
    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getStart() {
        start = (page - 1) * pageSize;
        return start;
    }
}


