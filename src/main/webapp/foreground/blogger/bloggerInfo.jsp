<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/7 0007
  Time: 上午 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="data_list">
    <div class="data_list_title">
        <img src="${pageContext.request.contextPath}/static/images/about_icon.png">&nbsp;关于博主
    </div>
    <div class="datas">
        <ul>
            <li>${blogger.profile}</li>
            <hr style="height: 5px;border: none;border-top:1px dashed gray;padding-bottom: 10px"/>
        </ul>
    </div>
</div>