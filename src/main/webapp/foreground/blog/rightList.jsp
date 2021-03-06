<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="data_list">
    <div class="data_list_title">
        <img src="./static/images/user_icon.png">
        博主信息
    </div>
    <div class="user_image">
        <img src="./static/userImages/${blogger.imagename}">
    </div>
    <%-- <div class="visitNum">访问量：6666</div>  --%>
    <div class="userSign">『<strong><span style="color: #EE6A50">${blogger.signature }</span></strong>』</div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="./static/images/byType_icon.png">
        文章分类
    </div>
    <div class="datas">
        <ul>
            <c:forEach items="${blogTypeList}" var="blogType">
                <li>
                    <span><a href="./index.html?typeId=${blogType.id}">${blogType.typeName}(${blogType.blogCount})</a> </span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="./static/images/byDate_icon.png">
        文章存档
    </div>
    <div class="datas">
        <ul>
            <c:forEach items="${blogTimeList}" var="blog">
                <li>
                    <span><a href="./index.html?releaseDateStr=${blog.releaseDateStr}">${blog.releaseDateStr}(${blog.blogCount})</a> </span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="data_list">
    <div class="data_list_title">
        <img src="./static/images/link_icon.png" />
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
        <img src="./static/images/comment_icon.png" />
        分享到
    </div>
    <div class="datas">
            <div style="text-align:left;padding-top:20px;">
                <%--百度分享代码--%>
                    <div class="bdsharebuttonbox">
                        <a href="#" class="bds_more" data-cmd="more"></a>
                        <a href="#" class="bds_qzone" data-cmd="qzone"></a>
                        <a href="#" class="bds_tsina" data-cmd="tsina"></a>
                        <a href="#" class="bds_tqq" data-cmd="tqq"></a>
                        <a href="#" class="bds_renren" data-cmd="renren"></a>
                        <a href="#" class="bds_weixin" data-cmd="weixin"></a>
                    </div>
                    <script>
                        window._bd_share_config={
                            "common":{
                                "bdSnsKey":{},
                                "bdText":"",
                                "bdMini":"2",
                                "bdPic":"",
                                "bdStyle":"0",
                                "bdSize":"16"},
                            "share":{},
                            "image":{
                                "viewList":["qzone","tsina","tqq","renren","weixin"],
                                "viewText":"分享到：","viewSize":"16"},
                            "selectShare":{
                                "bdContainerClass":null,
                                "bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};
                        with(document)0[(getElementsByTagName('head')[0]||body)
                                .appendChild(createElement('script'))
                                .src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
                    </script>
            </div>
    </div>
</div>

