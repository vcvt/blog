<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>友情链接管理页面</title>
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/icon.css">
    <script type="text/javascript" src="../static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../static/easyui/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
        var url;
        
        function addLink() {
            $("#dlg").dialog("open").dialog("setTitle", "添加友情链接信息");
            $("#fm").form("clear");
            url = "../admin/link/save.do";
        }
        
        function deleteLink() {
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
                    $.post("../admin/link/delete.do",
                            {ids: ids}, function(result){
                                if(result.success) {
                                    $("#dg").datagrid("reload");
                                } else {
                                    $.messager.alert("系统提示", "数据删除失败！");
                                }
                            }, "json");
                }
            });
        }

        function updateLink() {
            var selectedRows = $("#dg").datagrid("getSelections");
            if(selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一个要修改的友情链接");
                return;
            }
            var row = selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "修改友情链接信息");
            $("#fm").form("load", row);//会自动识别name属性，将row中对应的数据，填充到form表单对应的name属性中
            url = "../admin/link/save.do?id=" + row.id;
        }

        function saveLink() {
            $("#fm").form("submit",{
                url: url,   //上面定义了url
                onSubmit: function() {
                    return $(this).form("validate");
                }, //进行验证，通过才让提交
                success: function(result) {
                    var result = eval("(" + result + ")"); //将json格式的result转换成js对象
                    if(result.success) {
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload"); //刷新一下
                    } else {
                        $.messager.alert("系统提示", "友情链接保存失败");
                    }
                }
            });
        }
        function reload() {
            $("#dg").datagrid("reload");
        }
    </script>
    <script type="text/css">
        body{
            margin: 1px;
            font-family: "宋体", serif;
        }
    </script>
</head>

<body>
    <table id="dg" title="友情链接管理" class="easyui-datagrid" fitColumns="true" pagination="true"
           url="../admin/link/listLink.do" toolbar="#tb">
        <thead>
        <tr>
            <th field="cb" checkbox="true" align="center"></th>
            <th data-options="field:'id'" width="20" align="center">编号</th>
            <th data-options="field:'linkname'" width="100" align="center">友情链接名称</th>
            <th data-options="field:'linkurl'" width="200" align="center">友情链接地址</th>
            <th data-options="field:'linkorder'" width="50" align="center">友情链接序号</th>
        </tr>
        </thead>
    </table>
    <div id="tb">
        <div>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addLink()">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteLink()">删除</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="updateLink()">修改</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reload()">刷新</a>
        </div>
    </div>
    <div id="dlg" class="easyui-dialog" style="width:400px; height:200px; top: 200px;padding:10px 20px"
         closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post">
            <div style="width:100%;text-align:center">
                <div>
                    <label>
                        友情链接名称:&nbsp;&nbsp;
                        <input class="easyui-validatebox" type="text" id="linkname" name="linkname" data-options="required:true"/>
                    </label>
                </div><br>
                <div>
                    <label>
                        友情链接地址:&nbsp;&nbsp;
                        <input class="easyui-validatebox" type="text" id="linkurl" name="linkurl"
                               data-options="required:true,validtype:'url'" />
                    </label>
                </div><br>
                <div>
                    <label>
                        友情链接排序:&nbsp;&nbsp;
                        <input class="easyui-numberbox" type="text" id="linkorder" name="linkorder" data-options="required:true" />
                    </label>
                </div><br>
                <div>
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="saveLink()">保存</a>&nbsp;&nbsp;
                    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="javascript:$('#dlg').dialog('close')">关闭</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
