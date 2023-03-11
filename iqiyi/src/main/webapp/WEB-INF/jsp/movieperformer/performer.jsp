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
            电影列表--演员列表
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">电影演员编辑</a></li>
            <li class="am-active">演员列表</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="tpl-block">

                <%--电影列表--%>
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-id">电影ID</th>
                                    <th class="table-title">演员名称</th>
                                    <th class="table-type">饰演</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${mplist}" var="performer">
                                    <tr>
                                        <td>${performer.id}</td>
                                        <td><a href="#">${performer.performer}</a></td>
                                        <td>${performer.role}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <hr>
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
</html>
