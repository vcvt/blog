<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人博客系统后台管理页面</title>
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/icon.css">
    <script type="text/javascript" src="../static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        function openTab(text,url,iconCls){
            var tabs = $('#tabs');
            if(tabs.tabs("exists",text)){
               tabs.tabs("select",text);
            }else{
                var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='../admin/"+url+"'></iframe>";
                tabs.tabs("add",{
                    title:text,
                    iconCls:iconCls,
                    closable:true,
                    content:content,
                    pill:true
                });
            }
        }

        function openPasswordModifyDialog() {
            $("#dlg").dialog("open").dialog("setTitle", "修改密码");
        }

        function modifyPassword() {
            $('#fm').form('submit',{
                url: "../admin/blogger/modifyPassword.do",
                onSubmit: function() {
                    var newPassword = $("#password").val();
                    var newPassword2 = $("#password2").val();
                    if(!$(this).form("validate")) {
                        return false; //验证不通过直接false，即没填
                    }
                    if(newPassword != newPassword2) {
                        $.messager.alert("系统提示", "两次密码必须填写一致");
                        return false;
                    }
                    return true;
                }, //进行验证，通过才让提交
                success: function(result) { //result为{"success","true/false"}
                    var result = eval("(" + result + ")"); //将json格式的result转换成js对象
                    if(result.success) {
                        $.messager.alert("系统提示", "密码修改成功，下一次登陆生效");
                        closePasswordModifyDialog();
                    } else {
                        $.messager.alert("系统提示", "密码修改失败");
                    }
                }
            });
        }
        function closePasswordModifyDialog() {
            $("#password").val(""); //保存成功后将内容置空
            $("#password2").val("");
            $("#dlg").dialog("close"); //关闭对话框
        }
        function refreshSystemCache() {
            $.post("../admin/system/refreshSystemCache.do",{},function(result){
                if(result.success){
                    $.messager.alert("系统提示","已成功刷新系统缓存！");
                }else{
                    $.messager.alert("系统提示","刷新系统缓存失败！");
                }
            },"json");
        }

        function logout() {
            $.messager.confirm("系统提示","您确定要退出系统吗？", function(r){
                if(r) {
                    window.location.href = "../admin/blogger/logout.do";
                }
            });
        }
    </script>
    <style type="text/css">
        body {
            font-family: '宋体',serif;
        }
        #menu ul{
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #menu ul li{
            border-bottom: 1px solid #fff;
        }
        #menu ul li a {
            /*先将a标签转换为块级元素，才能设置宽和内间距*/
            display: block;
            background-color: blue;
            color: #fff;
            text-decoration: none;
            text-align: left;
        }
        #menu ul li a:hover {
            background-color: #008792;
        }
    </style>
</head>

<body class="easyui-layout">
<div data-options="region:'north'" style="height: 78px; background-color: #E0ECFF">
    <table style="padding: 5px" width="100%">
        <tr>
            <td width="50%">
                <h2>博客后台系统</h2>
            </td>
            <td valign="bottom" align="right" width="50%">
                <font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${currentUser.username }</font>
            </td>
        </tr>
    </table>
</div>
<div data-options="region:'center'">
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
        <div title="首页" data-options="iconCls:'icon-home'">
            <div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
        </div>
    </div>
</div>
<div data-options="region:'west'" style="width: 150px" title="导航菜单" split="true">
    <div id="menu" class="easyui-accordion" data-options="fit:true,border:false">
        <div title="常用操作" data-options="selected:true,iconCls:'icon-item'" style="padding: 10px">
            <ul>
                <li><a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" >写博客</a>
                <li><a href="javascript:openTab('评论审核','commentReview.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'">评论审核</a>
            </ul>
        </div>
        <div title="博客管理"  data-options="iconCls:'icon-bkgl'" style="padding:10px;">
            <ul>
                <li><a href="javascript:openTab('写博客','writeBlog.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'">写博客</a>
                <li><a href="javascript:openTab('博客信息管理','blogManage.jsp','icon-bkgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bkgl'">博客信息管理</a>
            </ul>
        </div>
        <div title="博客类别管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
            <ul>
                <li><a href="javascript:openTab('博客类别信息管理','blogTypeManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'">博客类别信息管理</a>
            </ul>
        </div>
        <div title="评论管理"  data-options="iconCls:'icon-plgl'" style="padding:10px">
            <ul>
                <li><a href="javascript:openTab('评论审核','commentReview.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'">评论审核</a>
                <li><a href="javascript:openTab('评论信息管理','commentManage.jsp','icon-plgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-plgl'">评论信息管理</a>
            </ul>
        </div>
        <div title="个人信息管理"  data-options="iconCls:'icon-grxx'" style="padding:10px">
            <ul>
                <li><a href="javascript:openTab('修改个人信息','modifyInfo.jsp','icon-grxxxg')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-grxxxg'">修改个人信息</a>
            </ul>
        </div>
        <div title="系统管理"  data-options="iconCls:'icon-system'" style="padding:10px">
            <ul>
                <li><a href="javascript:openTab('友情链接管理','linkManage.jsp','icon-link')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-link'">友情链接管理</a>
                <li><a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'">修改密码</a>
                <li><a href="javascript:refreshSystemCache()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'">刷新系统缓存</a>
                <li><a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'">安全退出</a>
            </ul>
        </div>
    </div>
</div>
<div region="south" style="height: 25px;padding: 5px" align="center">
    Copyright © 2012-2016 SSM博客系统 版权所有
</div>
<div id="dlg" class="easyui-dialog" style="width:400px; height:200px; padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <div style="width:100%;text-align:center">
            <div>
                <label>
                    用户名:&nbsp;&nbsp;
                    <input class="easyui-validatebox" type="text" id="name" name="name" data-options="required:true"
                           value="${blogger.username}" readonly="readonly"/>
                </label>
            </div><br>
            <div>
                <label>
                    新密码:&nbsp;&nbsp;
                    <input class="easyui-validatebox" type="text" id="password" name="password" data-options="required:true" />
                </label>
            </div><br>
            <div>
                <label>
                    确认新密码:
                    <input class="easyui-validatebox" type="text" id="password2" name="password2" data-options="required:true" />
                </label>
            </div><br>
            <div>
                <a href="javascript:modifyPassword()" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true" >保存</a>&nbsp;&nbsp;
                <a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">关闭</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
