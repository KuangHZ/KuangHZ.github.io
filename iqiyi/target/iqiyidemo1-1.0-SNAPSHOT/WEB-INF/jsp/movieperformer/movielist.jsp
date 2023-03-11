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
            电影列表--演员编辑
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">电影演员编辑</a></li>
            <li class="am-active">电影列表</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="tpl-block">
                <div class="am-g">
                    <%--电影检索--%>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-form-group">
                            <select id="selName1" data-am-selected="{btnSize: 'sm'}">
                                <c:forEach items="${searchS}" var="name">
                                    <c:choose>
                                        <c:when test="${name == conditionBean.flag}">
                                            <option value="${name}" selected>${name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${name}">${name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <%--搜索值--%>
                            <input type="text" id="keyword1" value="${conditionBean.keyword}" class="am-form-field">
                            <span class="am-input-group-btn">
                                <button onclick="search(1)" class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
                            </span>
                        </div>
                    </div>
                </div>

                <%--电影列表--%>
                <div class="am-g">
                    <div class="am-u-sm-12">
                            <table class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-id">ID</th>
                                    <th class="table-title">标题</th>
                                    <th class="table-type">时长</th>
                                    <th class="table-author am-hide-sm-only">导演</th>
                                    <th class="table-date am-hide-sm-only">评分</th>
                                    <th class="table-set">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pageInfo.list}" var="movie">
                                        <tr>
                                            <td>${movie.id}</td>
                                            <td><a href="#">${movie.moviename}</a></td>
                                            <td>${movie.time}</td>
                                            <td class="am-hide-sm-only">${movie.moviedetailtable.director}</td>
                                            <td class="am-hide-sm-only">${movie.score}</td>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <button onclick="lookPerformer(${movie.id})" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 查看</button>
                                                        <a href="${pageContext.request.contextPath}/performer/edit-current-performer?id=${movie.id}" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 修改</a>
                                                        <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="am-cf">
                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                        <%--上一页--%>
                                        <c:choose>
                                            <c:when test="${pageInfo.pageNum == 1}">
                                                <li class="am-disabled"><a href="">«</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a href="javascript:search(${pageInfo.pageNum - 1})">«</a></li>
                                            </c:otherwise>
                                        </c:choose>

                                        <%--页码--%>
                                        <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                                            <c:choose>
                                                <c:when test="${num == pageInfo.pageNum}">
                                                    <li class="am-active"><a href="javascript:search(${num})">${num}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a href="javascript:search(${num})">${num}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                        <%--下一页--%>
                                        <c:choose>
                                            <c:when test="${pageInfo.pageNum == pageInfo.pages}">
                                                <li class="am-disabled"><a href="">»</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a href="javascript:search(${pageInfo.pageNum + 1})">»</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </div>
                            </div>
                            <hr>
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
<%--表单：保存要跳转到的页码，以及其他--%>
<form id="movieForm" action="${pageContext.request.contextPath}/performer/show-movie-performer" method="post">
    <%--保存页码--%>
    <input name="currentPage" id="currentPage" type="hidden">
    <%--保存搜索列表的选项--%>
    <input name="area" id="area" type="hidden">
    <input name="type" id="type" type="hidden">
    <input name="style" id="style" type="hidden">
    <input name="year" id="year" type="hidden">
    <input name="mname" id="mname" type="hidden">
    <%--保存关键字-搜索值--%>
    <input name="keyword" id="keyword2" type="hidden">
</form>
</body>
<script type="text/javascript">
    function search(currentPage) {
        $("#currentPage").val(currentPage);
        $("#keyword2").val($("#keyword1").val());

        var s = $("#selName1").val();
        if(s == "地区"){
            $("#area").val("地区");
        }
        if(s == "类型"){
            $("#type").val("类型");
        }
        if(s == "规格"){
            $("#style").val("规格");
        }
        if(s == "我的年代"){
            $("#year").val("我的年代");
        }
        if(s == "电影名称"){
            $("#mname").val("电影名称");
        }
        $("#movieForm").submit();
    }

    function lookPerformer(id) {
        location.href = "${pageContext.request.contextPath}/performer/show-current-performer?id="+id;
    }
</script>
</html>
