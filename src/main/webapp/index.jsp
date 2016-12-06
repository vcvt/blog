<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blog.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-1.11.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <title>博客主页</title>
    <style type="text/css">
        body{
            padding-top:10px;
            padding-bottom:40px;
            background-color: #F8F8FF;
            font-family: microsoft yahei;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="blog"><strong>某某的博客</strong></div>
        </div>
        <div class="col-md-8">
            <%--<iframe style="float:right" width="420" scrolling="no" height="60" frameborder="0"
                    allowtransparency="true"
                    src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5"></iframe>--%>
            <iframe style="float: right" width="200" scrolling="no" height="20" frameborder="0"
                    allowtransparency="true"
                    src="http://i.tianqi.com/index.php?c=code&id=10&color=%230070C0&icon=1"></iframe>
        </div>
    </div>

    <div class="row" style="padding-top: 10px">
        <div class="col-md-12">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a class="navbar-brand" href="#">博客首页</a></li>
                            <li><a class="navbar-brand" href="#">关于博主</a></li>
                            <li><a class="navbar-brand" href="#">我的相册</a></li>
                            <li><a class="navbar-brand" href="#">资源小站</a></li>
                            <li><a class="navbar-brand" href="#">程序人生</a></li>
                            <li><a class="navbar-brand" href="#">CSDN</a></li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="请输入要查询的关键字">
                            </div>
                            <button type="submit" class="btn btn-default">搜索</button>
                        </form>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="data_list">
                <div class="data_list_title">
                    <img src="${pageContext.request.contextPath}/static/images/user_icon.png"/>
                    博主信息
                </div>
                <div class="user_image">
                    <img src="${pageContext.request.contextPath}/static/userImages/${blogger.imagename}"/>
                </div>
                <div class="nickName">${blogger.nickname }</div>
                <div class="userSign">${blogger.sign }</div>
            </div>

            <div class="data_list">
                <div class="data_list_title">
                    <img src="${pageContext.request.contextPath}/static/images/byType_icon.png"/>
                    文章分类
                </div>
                <div class="datas">
                    <ul>
                        <c:forEach items="${blogTypeList }" var="blogType">
                            <li><span><a href="#">${blogType.typeName }（${blogType.blogCount }）</a></span></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <div class="data_list">
                <div class="data_list_title">
                    <img src="${pageContext.request.contextPath}/static/images/byDate_icon.png"/>
                    文章存档
                </div>
                <div class="datas">
                    <ul>
                        <c:forEach items="${blogTimeList }" var="blog">
                            <li><span><a href="#">${blog.releaseDateStr }（${blog.blogCount }）</a></span></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <div class="data_list">
                <div class="data_list_title">
                    <img src="${pageContext.request.contextPath}/static/images/link_icon.png"/>
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


        </div>

        <div class="col-md-9">
            <div class="data_list">
                <div class="data_list_title">
                    <img src="${pageContext.request.contextPath}/static/images/list_icon.png"/>&nbsp;最新博客
                </div>
                <div class="datas">
                    <ul>
                        <c:forEach items="${blogList }" var="blog">
                            <li style="margin-bottom: 30px">
						  	<span class="title">
						  		<img alt="文章类型" src="${pageContext.request.contextPath}/static/userImages/yuan.jpg">
						  		<a href="#">${blog.title}</a>
						  	</span>
                                <span class="summary">${blog.summary}</span>
                                <span class="info">
						  		<font color="#999">${blog.releaseDate}</font> &nbsp;&nbsp;
						  		<font color="#33a5ba"><a href="#">阅读</a><font color="#999">(${blog.clickHit})</font>&nbsp;&nbsp;</font>
						  		<font color="#33a5ba"><a href="#">评论</a><font color="#999">(${blog.replyHit})</font>&nbsp;&nbsp;</font>
						  	</span>
                            </li>
                            <hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12" >
            <div class="footer" align="center" style="padding-top: 120px" >
                <font>Copyright © 2012-2016 SSM个人博客系统 版权所有</font>
            </div>
        </div>
    </div>
</div>
</body>
</html>
