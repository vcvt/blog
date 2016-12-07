<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/7 0007
  Time: 上午 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-md-4">
    <div class="blog">
        <a href="${pageContext.request.contextPath}/index.html" style="text-decoration: none">
            <h1><strong>某某的博客</strong></h1>
        </a>
    </div>
</div>
<div class="col-md-8">
    <%--天气插件--%>
    <iframe style="float: right" width="200" scrolling="no" height="20" frameborder="0"
            allowtransparency="true"
            src="http://i.tianqi.com/index.php?c=code&id=10&color=%230070C0&icon=1"></iframe>
</div>
