<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>爱电影后台项目</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
    <script src="${pageContext.request.contextPath}/assets/js/echarts.min.js"></script>
</head>

<body data-type="index">


<%--此处设置头部分--%>
<jsp:include page="/WEB-INF/jsp/nav/header.jsp"></jsp:include>
<%--此处设置头部分--%>

<%--此处设置左侧部分--%>
<jsp:include page="/WEB-INF/jsp/nav/left.jsp"></jsp:include>
<%--此处设置左侧部分--%>

<div class="tpl-page-container tpl-page-header-fixed">

    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            电影列表--演员列表编辑
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">电影演员编辑</a></li>
            <li class="am-active">演员列表编辑</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="tpl-block">

                <%--新增按钮--%>
                <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                                <%--新增电影按钮--%>
                                <div class="am-btn-group am-btn-group-xs">
                                    <a href="javascript:addElement()" type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</a>
                                </div>
                            </div>
                        </div>
                    </div>

                <%--电影列表--%>
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form" action="${pageContext.request.contextPath}/performer/edit-movie-performer" method="post">
                            <table id="tableId" class="am-table am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-id">电影ID</th>
                                    <th class="table-title">演员名称</th>
                                    <th class="table-type">饰演</th>
                                    <th class="table-set">操作</th>
                                </tr>
                                </thead>
                                <tbody id="tbody1">
                                <c:forEach items="${mplist}" var="performer" varStatus="sta">
                                    <tr id="${sta.index}">
                                        <td><input id="inputId${sta.index}" name="list[${sta.index}].id" value="${performer.id}" readonly></td>
                                        <td><input name="list[${sta.index}].performer" value="${performer.performer}"></td>
                                        <td><input name="list[${sta.index}].role" value="${performer.role}"></td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <a href="javascript:deleteTr('${sta.index}')" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <hr>
                            <input type="submit" value="提交">
                        </form>
                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>

    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/iscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
<script type="text/javascript">
    /*删除页面中的一行tr*/
    function deleteTr(id) {
        //获取表格对象
        var table = document.getElementById("tableId");
        //获取行对象
        var tr = document.getElementById(id);
        //行对象的索引
        var index = tr.rowIndex;
        //在表格中删除指定索引的一行
        table.deleteRow(index);
    }

    //在页面中增加一行tr
    function addElement(id) {

        //获取到tbody对象
        var tab=document.getElementById("tbody1");
        //添加一行
        var newTR = tab.insertRow(tab.rows.length);
        var num = tab.rows.length-1;
        //给新插入的一行设置id
        newTR.id = num;
        //插入一行tr，tr中包含三个文本框、删除按钮
        newTR.innerHTML=
            '<tr id="'+num+'">\n' +
            ' <td><input id="inputId'+num+'" name="list['+num+'].id"></td>\n' +
            ' <td><input name="list['+num+'].performer"></td>\n' +
            ' <td><input name="list['+num+'].role"></td>\n' +
            ' <td>\n' +
            '     <div class="am-btn-toolbar">\n' +
            '         <div class="am-btn-group am-btn-group-xs">\n' +
            '             <a href="javascript:deleteTr(\''+num+'\')" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</a>\n' +
            '         </div>\n' +
            '     </div>\n' +
            ' </td>\n' +
            '</tr>';

    }
</script>
</html>
