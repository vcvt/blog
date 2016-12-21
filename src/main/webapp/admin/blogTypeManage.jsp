<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客类别管理页面</title>
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/icon.css">
    <script type="text/javascript" src="../static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../static/easyui/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
        var url;
        function addBlogType() {
            $("#dlg").dialog("open").dialog("setTitle", "添加博客类别信息");
            $("#fm").form("clear");
            url = "../admin/blogType/save.do";
        }

        function updateBlogType() {
            var selectedRows = $("#dg").datagrid("getSelections");
            if(selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一个要修改的博客类别");
                return;
            }
            var row = selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "修改博客类别信息");
            $("#fm").form("load", row);//会自动识别name属性，将row中对应的数据，填充到form表单对应的name属性中
            url = "../admin/blogType/save.do?id=" + row.id;
        }

        function saveBlogType() {
            $("#fm").form("submit",{
                url: url,
                onSubmit: function() {
                    return $(this).form("validate");
                }, //进行验证，通过才让提交
                success: function(result) {
                    var result = eval("(" + result + ")"); //将json格式的result转换成js对象
                    if(result.success) {
                        $.messager.alert("系统提示", "博客类别保存成功");
                        $("#dlg").dialog("close"); //关闭对话框
                        $("#dg").datagrid("reload"); //刷新一下
                    } else {
                        $.messager.alert("系统提示", "博客类别保存失败");
                    }
                }
            });
        }

        function deleteBlogType() {
            var selectedRows = $("#dg").datagrid("getSelections");
            if(selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的数据");
                return;
            }
            var idsStr = [];
            for(var i = 0; i < selectedRows.length; i++) {
                idsStr.push(selectedRows[i].id);
            }
            var ids = idsStr.join(","); //1,2,3,4
            $.messager.confirm("系统提示", "<font color=red>您确定要删除选中的"+selectedRows.length+"条数据么？</font>", function(r) {
                if(r) {
                    $.post("../admin/blogType/delete.do",
                            {ids: ids}, function(result){
                                if(result.exist) {
                                    $.messager.alert("系统提示", result.exist);
                                } else if(result.success) {
                                    $.messager.alert("系统提示", "数据删除成功！");
                                    $("#dg").datagrid("reload");
                                } else {
                                    $.messager.alert("系统提示", "数据删除失败！");
                                }
                            }, "json");
                }
            });
        }

        function reload() {
            $("#dg").datagrid("reload");
        }
    </script>
    <style>
        body{
            margin: 1px;
            font-family: '宋体', serif;
        }
    </style>
</head>
<body>
<table id="dg" title="博客类别管理" class="easyui-datagrid" fitColumns="true" pagination="true"
       url="../admin/blogType/listBlogType.do" toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th data-options="field:'id'"  width="20" align="center">编号</th>
        <th data-options="field:'typeName'" width="100" align="center">博客分类名称</th>
        <th data-options="field:'orderNum'" width="100" align="center">类别排序</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBlogType()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBlogType()">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateBlogType()">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
    </div>
</div>
<div id="dlg" class="easyui-dialog" style="width:400px; height:200px; top: 200px; padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <div style="width:100%;text-align:center">
            <div>
                <label>
                    博客类别名称:&nbsp;
                    <input class="easyui-validatebox" type="text" id="typeName" name="typeName" data-options="required:true"/>
                </label>
            </div><br>
            <div>
                <label>
                    博客类别排序:&nbsp;
                    <input class="easyui-numberbox" type="text" id="orderNum" name="orderNum" data-options="required:true"/>
                </label>
            </div><br>
            <div>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="saveBlogType()">保存</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="javascript:$('#dlg').dialog('close')">关闭</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
