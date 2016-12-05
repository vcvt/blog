package com.blog.entity;

/**
 * Created by Administrator
 */
public class Link {

    private int id;
    private String linkname;
    private String linkurl;
    private int linkorder;

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getLinkorder() {
        return linkorder;
    }

    public void setLinkorder(int linkorder) {
        this.linkorder = linkorder;
    }
}
