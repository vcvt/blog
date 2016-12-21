<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="data_list">
    <div class="data_list_title">
        <img src="./static/images/about_icon.png">&nbsp;关于博主
        ${pageContext.request.contextPath}
    </div>
    <div class="datas">
        <ul>
            <li>${blogger.profile}</li>
            <hr style="height: 5px;border: none;border-top:1px dashed gray;padding-bottom: 10px"/>
        </ul>
    </div>
</div>