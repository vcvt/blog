package com.blog.entity;

import java.util.Date;

/**
 * Created by Administrator
 */
public class Blog {

    private int id;
    private String title;   //标题
    private String summary; //概要
    private Date releaseDate;   //发布日期
    private int clickHit;   //阅读量
    private int replyHit;   //评论量
    private String content; //内容
    private String keyword; //关键字

    private BlogType blogType;  //博客类型
    private int blogCount; //博客数量
    private String releaseDateStr; //发布日期字符串，只取年月，用来显示在页面

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getClickHit() {
        return clickHit;
    }

    public void setClickHit(int clickHit) {
        this.clickHit = clickHit;
    }

    public int getReplyHit() {
        return replyHit;
    }

    public void setReplyHit(int replyHit) {
        this.replyHit = replyHit;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public BlogType getBlogType() {
        return blogType;
    }

    public void setBlogType(BlogType blogType) {
        this.blogType = blogType;
    }

    public int getBlogCount() {
        return blogCount;
    }

    public void setBlogCount(int blogCount) {
        this.blogCount = blogCount;
    }

    public String getReleaseDateStr() {
        return releaseDateStr;
    }

    public void setReleaseDateStr(String releaseDateStr) {
        this.releaseDateStr = releaseDateStr;
    }
}
