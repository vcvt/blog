<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--重定向到index.html,让spring mvc接收，这里的.html是伪静态，springmvc接收所有的.do和.html结尾的请求 --%>
<% response.sendRedirect("index.html");%>
