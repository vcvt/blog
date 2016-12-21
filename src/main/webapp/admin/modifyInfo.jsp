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
                    return $(this).form("validate");
                }, //进行验证，通过才让提交
                success: function(result) {
                    var result = eval("(" + result + ")"); //将json格式的result转换成js对象
                    if(result.success) {
                        $.messager.alert("系统提示", "博主信息更新成功");
                    } else {
                        $.messager.alert("系统提示", "博主信息更新失败");
                    }
                }
            });
        }
    </script>
    <style>
        body{
            margin: 10px;
            font-family: '宋体', serif;
        }
    </style>
</head>

<body>
    <div id="p" class="easyui-panel" title="修改个人信息" style="padding: 10px;">
        <form id="fm" method="post" enctype="multipart/form-data">
            <div style="width:100%;text-align:left">
                <div>
                    <label>
                        用户名&nbsp;&nbsp;:
                        <input class="easyui-validatebox" type="text" id="username" name="username"
                               value="${blogger.username}" readonly="readonly"/>
                    </label>
                </div><br>
                <div>
                    <label>
                        昵称&nbsp;&nbsp;&nbsp;:
                        <input class="easyui-validatebox" type="text" id="nickname" name="nickname" data-options="required:true"
                               value="${blogger.nickname}"/>
                    </label>
                </div><br>
                <div>
                    <label>
                        个性签名&nbsp;:
                        <input class="easyui-validatebox" type="text" id="signature" name="signature" data-options="required:true"
                               value="${blogger.signature}"/>
                    </label>
                </div><br>
                <div>
                    <label>
                        个人头像&nbsp;:
                        <input type="file" id="imageFile" name="imageFile"/>
                    </label>
                </div><br>
                <div>
                    <label>
                        个人简介&nbsp;:
                        <textarea name="a" style="width:400px;height:80px;">${blogger.profile}</textarea>
                    </label>
                </div><br>
                <div>
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       data-options="iconCls:'icon-submit'" onclick="submitData()">提交</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
