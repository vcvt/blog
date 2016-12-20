<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/19 0019
  Time: 下午 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>写博客页面</title>
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../static/easyui/demo/demo.css">
    <script type="text/javascript" src="../static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../static/easyui/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" charset="utf-8" src="../static/ueditor1_4_3_3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../static/ueditor1_4_3_3/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../static/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>

    <script type="text/javascript">
        function submitData() {
            $("#fm").form("submit",{
                url: "../admin/blogger/save.do",
                onSubmit: function() {
                    var profile = UE.getEditor("profile").getContent();
                    $("#pf").val(profile); //将UEditor编辑器中的内容放到隐藏域中提交到后台
                    return $(this).form("validate");
                }, //进行验证，通过才让提交
                success: function(result) {
                    var result = eval("(" + result + ")"); //将json格式的result转换成js对象
                    if(result.success) {
                        $.messager.alert("系统提示", "博主信息更新成功");
                    } else {
                        $.messager.alert("系统提示", "博主信息更新失败");
                        return;
                    }
                }
            });
        }
    </script>
</head>

<body style="margin: 10px; font-family: microsoft yahei">
    <div id="p" class="easyui-panel" title="修改个人信息" style="padding: 10px;">
        <form id="fm" method="post" enctype="multipart/form-data">
            <table cellspacing="20px">
                <tr>
                    <td width="80px">用户名：</td>
                    <td>
                        <input type="hidden" id="id" name="id" value="${blogger.id }"/>
                        <input type="text" id="username" name="username" style="width:200px" readonly="readonly" value="${blogger.username }"/>
                    </td>
                </tr>
                <tr>
                    <td>昵称：</td>
                    <td>
                        <input type="text" id="nickname" name="nickname" style="width:200px"
                               class="easyui-validatebox" required="true" value="${blogger.nickname}"/>
                    </td>
                </tr>
                <tr>
                    <td>个性签名：</td>
                    <td>
                        <input type="text" id="signature" name="signature" style="width:400px"
                               class="easyui-validatebox" required="true" value="${blogger.signature}"/>
                    </td>
                </tr>
                <tr>
                    <td>个人头像：</td>
                    <td>
                        <input type="file" id="imageFile" name="imageFile"/>
                    </td>
                </tr>
                <tr>
                    <td>个人简介：</td>
                    <td>
                        <textarea name="a" style="width:400px;height:80px;">${blogger.profile}</textarea>
 <%--                       <script id="profile" type="text/plain" style="width:80%; height:500px;"></script>
                        <input type="hidden" id="pf" name="profile"> &lt;%&ndash; UEditor不能作为表单的一部分提交，所以用这种隐藏域的方式 &ndash;%&gt;--%>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="javascript:submitData()" class="easyui-linkbutton"
                           data-options="iconCls:'icon-submit'">提交</a></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
