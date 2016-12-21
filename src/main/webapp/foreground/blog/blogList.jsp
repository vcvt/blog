<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="data_list">
    <div class="data_list_title">
        <%--因为是controller请求jsp，所以${${pageContext.request.contextPath}应为/Idea,即.jsp在/Idea目录下，同级目录用./}--%>
        <img src="./static/images/list_icon.png"/>&nbsp;最新博客
    </div>
    <div class="datas">
        <ul>
            <c:forEach items="${blogList}" var="blog">
                <li style="margin-bottom: 30px">
					  	<span class="title">
					  		<img alt="文章类型" src="./static/userImages/yuan.jpg">
					  		<a href="blog/articles/${blog.id}.html">${blog.title }</a>
					  	</span>
                    <span class="summary">摘要: ${blog.summary }....</span>
                    <span class="img">
					  		<c:forEach items="${blog.imageList }" var="image">
                                <a href="blog/articles/${blog.id}.html">${image }</a>
                                &nbsp;&nbsp;
                            </c:forEach>

					  	</span>
                    <span class="info">
					  		<font color="#999"><fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></font> &nbsp;&nbsp;
					  		<font color="#33a5ba"><a href="blog/articles/${blog.id}.html">阅读</a><font color="#999">(${blog.clickHit })</font>&nbsp;&nbsp;</font>
					  		<font color="#33a5ba"><a href="blog/articles/${blog.id}.html">评论</a><font color="#999">(${blog.replyHit })</font>&nbsp;&nbsp;</font>
					  	</span>
                </li>
                <hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />
            </c:forEach>
        </ul>
    </div>

    <div style="text-align: center;">
        <nav>
            <ul class="pagination">
                ${pageCode }
            </ul>
        </nav>
    </div>
</div>