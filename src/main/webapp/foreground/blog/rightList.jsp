<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/7 0007
  Time: 上午 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/static/images/user_icon.png">
        博主信息
    </div>
    <div class="user_image">
        <img src="${pageContext.request.contextPath}/static/userImages/${blogger.imagename}">
    </div>
    <%-- <div class="visitNum">访问量：6666</div>  --%>
    <div class="userSign">『<strong><span style="color: #EE6A50">${blogger.sign }</span></strong>』</div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/static/images/byType_icon.png">
        文章分类
    </div>
    <div class="datas">
        <ul>
            <c:forEach items="${blogTypeList}" var="blogType">
                <li>
                    <span><a href="${pageContext.request.contextPath}/index.html?typeId=${blogType.id}">${blogType.typeName}(${blogType.blogCount})</a> </span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/static/images/byDate_icon.png">
        文章存档
    </div>
    <div class="datas">
        <ul>
            <c:forEach items="${blogTimeList}" var="blog">
                <li>
                    <span><a href="${pageContext.request.contextPath}/index.html?releaseDateStr=${blog.releaseDateStr}">${blog.releaseDateStr}(${blog.blogCount})</a> </span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/static/images/link_icon.png" />
        友情链接
    </div>
    <div class="datas">
        <ul>
            <c:forEach items="${linkList }" var="link">
                <li><span><a href="${link.linkurl }" target="_blank">${link.linkname }</a></span></li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/static/images/comment_icon.png" />
        分享到
    </div>
    <div class="datas">
        <ul>
            <div style="text-align:left;padding-top:20px;">
                <%--分享代码--%>
                <div class="bshare-custom">
                    <a title="分享到QQ空间" class="bshare-qzone"></a>
                    <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
                    <a title="分享到人人网" class="bshare-renren"></a>
                    <a title="分享到腾讯微博" class="bshare-qqmb"></a>
                    <a title="分享到网易微博" class="bshare-neteasemb"></a>
                    <a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
                    <span class="BSHARE_COUNT bshare-share-count">0</span>
                </div>
                <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"/>
                <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"/>
            </div>
        </ul>
    </div>
</div>

