<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
    function checkData() {
        var q = document.getElementById("q").value.trim();
        if(q == null || q == ""){
            alert("请输入您要查询的关键字!");
            return false;
        }else {
            return true;
        }
    }
</script>

<div class="col-md-12">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a class="navbar-brand" href="index.html" onclick="changeClass(this)">博客首页</a></li>
                    <li><a class="navbar-brand" href="blogger/aboutme.html" onclick="changeClass(this)">关于博主</a></li>
                    <li><a class="navbar-brand" href="blogger/myalbum.html" onclick="changeClass(this)">我的相册</a></li>
                    <li><a class="navbar-brand" href="blogger/resource.html" onclick="changeClass(this)">资源小站</a></li>
                    <li><a class="navbar-brand" href="http://my.csdn.net/" target="blank">我的CSDN</a></li>
                </ul>
                <form action="blog/search.html" class="navbar-form navbar-right" role="search" method="post" onsubmit="return checkData()">
                    <div class="form-group">
                        <input type="text" id="q" name="q" value="${q}" class="form-control" placeholder="请输入要查询的关键字">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
            </div>
        </div>
    </nav>
</div>
