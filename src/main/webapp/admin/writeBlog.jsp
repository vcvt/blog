<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8"
            src="../static/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>

    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    <script type="text/javascript">
        function submitData() {
            var title = $("#title").val();
            var blogTypeId = Math.ceil(Math.random() * ${blogTypeListLength});
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
                            'title' : title,
                            'blogType.id' : blogTypeId,
                            'content' : content,
                            'summary' : summary,
                            'keyword' : keyword,
                            'contentNoTag' : contentNoTag
                        }, function(result) {
                            if (result.success) {
                                $.messager.alert("系统提示", "博客发布成功！");
                                clearValues();
                            } else {
                                $.messager.alert("系统提示", "博客发布失败！");
                            }
                        }, "json");
            }
        }
    </script>
    <script type="text/css">
        body{
            margin: 10px;
            font-family: "宋体",serif;
        }
    </script>
</head>

<body>
    <div id="p" class="easyui-panel" title="写博客" style="width:100%;padding: 10px;">
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
                            <select id="blogTypeId" style="width:154px" name="blogTypeId" editable="false" panelHeight="auto">
                                <option value="">请选择博客内容...</option>
                                <c:forEach items="${blogTypeList }" var="blogType">
                                    <option value="${blogType.id }">${blogType.typeName }</option>
                                </c:forEach>
                            </select>
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
                           data-options="iconCls:'icon-submit'" onclick="submitData()">发布博客</a>
                    </div>
                </div>
            </form>
        </div>
</body>
</html>
