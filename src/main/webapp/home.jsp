<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/7 0007
  Time: 上午 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--重定向到index.html,让spring mvc接收，这里的.html是伪静态，springmvc接收所有的.do和.html结尾的请求 --%>
<% response.sendRedirect("index.html");%>
