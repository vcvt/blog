package com.blog.entity;

/**
 * Created by Administrator
 */
public class Link {

    private Integer id;
    private String linkname;
    private String linkurl;
    private Integer linkorder;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLinkname() {
        return linkname;
    }

    public void setLinkname(String linkname) {
        this.linkname = linkname;
    }

    public String getLinkurl() {
        return linkurl;
    }

    public void setLinkurl(String linkurl) {
        this.linkurl = linkurl;
    }

    public Integer getLinkorder() {
        return linkorder;
    }

    public void setLinkorder(Integer linkorder) {
        this.linkorder = linkorder;
    }
}
