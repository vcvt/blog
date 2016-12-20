<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/6 0006
  Time: 下午 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="static/css/blog.css">
    <script src="static/bootstrap/js/jquery-1.11.2.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>${title}</title>
    <script type="text/javascript">
        function changeClass(obj) {
            var li = obj.parentNode;    //获取父节点
            li.className = "active";
        }
    </script>
    <script type="text/css">
        body{
            padding-top:60px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
            font-family: "Microsoft YaHei";
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="row">
            <jsp:include page="foreground/common/head.jsp"/>
        </div>
        <div class="row" style="padding-top: 20px">
            <jsp:include page="foreground/common/menu.jsp"/>
        </div>
        <div class="row">
            <div class="col-md-9">
                <jsp:include page="${commonPage}"/>
            </div>
            <div class="col-md-3">
                <jsp:include page="foreground/blog/rightList.jsp"/>
            </div>
        </div>
        <div class="row">
            <jsp:include page="foreground/common/footer.jsp"/>
        </div>
    </div>
</body>
</html>
