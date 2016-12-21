<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改博客页面</title>
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../static/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../static/easyui/demo/demo.css">
    <script type="text/javascript" src="../static/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../static/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../static/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="../static/ueditor1_4_3_3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../static/ueditor1_4_3_3/ueditor.all.min.js">	</script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../static/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>

    <script type="text/javascript">
        $('#cc').combobox({
            //将请求发送给accountAction中的query方法处理，这里需要将处理好的数据返回到这边来显示了 ，所以后台需要将数据打包成json格式发过来
            url:'../admin/blogType/listBlogType.do',
            valueField:'blogType.id',
            textField:'blogType.typeName',
            panelHeight:'auto', //自适应高度
            panelWidth:120,//下拉列表是两个组件组成的
            width:120, //要同时设置两个宽度才行
            editable:false //下拉框不允许编辑
        })

        // 完成数据的回显，更新时，用户肯定先选择了要更新的那一行，首先我们得拿到那一行
        var rows = dg.datagrid("getSelections");
        //将拿到的那一行对应的数据字段加载到表单里，实现回显
        $("#fm").form('load',{
            title:rows[0].title,
            content:rows[0].content,
            keyword:rows[0].keyword,
            typeName:rows[0].typeName
        });
    </script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
        ue.addListener("ready", function(){
            //通过UE自己封装的ajax请求数据
            UE.ajax.request("../admin/blog/findById.do",
                    {
                        method: "post",
                        async: false,
                        data: {"id":"${param.id}"},
                        onsuccess: function(result) { //根据id查询Blog，返回一个json格式的blog对象
                            result = eval("(" + result.responseText + ")");
                            $("#title").val(result.title);
                            $("#keyword").val(result.keyword);
                            $("#blogTypeId").combobox("setValue", result.blogType.id);
                            UE.getEditor('editor').setContent(result.content);
                        }
                    });
        });
    </script>
    <script type="text/javascript">
        function submitData() {
            var title = $("#title").val();
            var blogTypeId = $("#blogTypeId").combobox("getValue");
            var content = UE.getEditor('editor').getContent();
            var summary = UE.getEditor('editor').getContentTxt().substr(0, 155);
            var keyword = $("#keyword").val();
            var contentNoTag = UE.getEditor('editor').getContentTxt();

            if (title == null || title == '') {
                $.messager.alert("系统提示", "请输入标题！");
            } else if (blogTypeId == null || blogTypeId == '') {
                $.messager.alert("系统提示", "请选择博客类型！");
            } else if (content == null || content == '') {
                $.messager.alert("系统提示", "请编辑博客内容！");
            } else {
                $.post("../admin/blog/save.do",
                        {
                            'id': '${param.id}',
                            'title' : title,
                            'blogType.id' : blogTypeId,
                            'content' : content,
                            'summary' : summary,
                            'keyword' : keyword,
                            'contentNoTag' : contentNoTag
                        }, function(result) {
                            if (result.success) {
                                $.messager.alert("系统提示", "博客修改成功！");
                            } else {
                                $.messager.alert("系统提示", "博客修改失败！");
                            }
                        }, "json");
            }
        }
        function clearValues() {
            $("#title").val("");
            $("#blogTypeId").combobox("setValue", "");
            UE.getEditor("editor").setContent("");
            $("#keyword").val("");
        }
    </script>

    <style>
        body{
            margin: 10px;
            font-family: '宋体',serif;
        }
    </style>
</head>
<body>
    <div id="p" class="easyui-panel" title="修改博客" style="width:100%;padding: 10px;">
        <form id="fm" method="post">
            <div style="width:100%;text-align:left">
                <div>
                    <label>
                        博客标题&nbsp;:
                        <input class="easyui-validatebox" type="text" id="title" name="title" style="width:400px" data-options="required:true"/>
                    </label>
                </div><br>
                <div>
                    <label>
                        所属类别&nbsp;:
                        <input id="cc" name="blogType.id">
                    </label>
                </div><br>
                <div>
                    <label>
                        博客内容&nbsp;:
                        <script id="editor" name="content" type="text/plain" style="width:80%; height:300px;"></script>
                    </label>
                </div><br>
                <div>
                    <label>
                        关键字&nbsp;&nbsp;:
                        <input type="text" id="keyword" name="keyword" style="width:400px" />&nbsp;&nbsp;多个关键字的话请用空格隔开
                    </label>
                </div><br>
                <div>
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       data-options="iconCls:'icon-submit'" onclick="submitData()">确认修改</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
