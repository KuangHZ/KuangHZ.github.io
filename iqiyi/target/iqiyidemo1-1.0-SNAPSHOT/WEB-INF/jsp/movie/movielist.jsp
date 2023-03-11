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
            电影列表
        </div>
        <ol class="am-breadcrumb">
            <li><a href="" class="am-icon-home">电影信息</a></li>
            <li><a href="">电影列表</a></li>
            <li class="am-active">内容</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <%--新增电影按钮--%>
                            <div class="am-btn-group am-btn-group-xs">
                                <a href="${pageContext.request.contextPath}/movie/show-add-movie" type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</a>
                                <a href="${pageContext.request.contextPath}/money/invest-money" type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-plus"></span> 充值</a>
                            </div>
                        </div>
                    </div>

                    <%--电影检索--%>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-form-group">
                            <select id="selName1" data-am-selected="{btnSize: 'sm'}">
                                <c:forEach items="${searchS}" var="name">
                                    <c:choose>
                                        <c:when test="${name == conditionBean.type}">
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


                <div class="am-g">
                    <div class="tpl-table-images">
                        <%--电影列表展示--%>
                        <c:forEach items="${pageInfo.list}" var="movie">
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                                <div class="tpl-table-images-content">
                                    <div class="tpl-table-images-content-i-time">发布时间：2020-09-12</div>
                                    <div class="tpl-i-title">
                                        ${movie.moviename}
                                    </div>
                                    <a href="${movie.url}" class="tpl-table-images-content-i">
                                        <div class="tpl-table-images-content-i-info">
                                            <span class="ico">
                                                <img src="${pageContext.request.contextPath}${movie.saveimagepath}" alt="">追逐
                                            </span>
                                        </div>
                                        <span class="tpl-table-images-content-i-shadow"></span>
                                        <img src="${pageContext.request.contextPath}${movie.saveimagepath}" alt="">
                                    </a>
                                    <div class="tpl-table-images-content-block">
                                        <div class="tpl-i-font">
                                            你最喜欢的作品，告诉大家它们是什么------大声的叫出来。。。。
                                        </div>
                                        <div class="tpl-i-more">
                                            <ul>
                                                <li><span class="am-icon-star am-text-warning"> ${movie.score}</span></li>
                                            </ul>
                                        </div>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs tpl-edit-content-btn">
                                                <a href="${pageContext.request.contextPath}/movie/show-edit-movie?id=${movie.id}" type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-edit"></span> 编辑</a>
                                                <a href="javascript:deleteMovie('${movie.id}','${movie.moviename}')" type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <%--分页页码--%>
                        <div class="am-u-lg-12">
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
<form id="movieForm" action="${pageContext.request.contextPath}/movie/show-movie" method="post">
    <%--保存页码--%>
    <input name="currentPage" id="currentPage" type="hidden">
    <%--保存搜索列表的选项--%>
    <input name="area" id="地区" type="hidden">
    <input name="type" id="leixing" type="hidden">
    <input name="style" id="规格" type="hidden">
    <input name="year" id="我的年代" type="hidden">
    <input name="mname" id="电影名称" type="hidden">
    <input name="keyword" id="keyword2" type="hidden">
</form>
</body>
<script type="text/javascript">
    function search(currentPage) {
        $("#currentPage").val(currentPage);

        $("#leixing").val($("#selName1").val());

        $("#keyword2").val($("#keyword1").val());

        $("#movieForm").submit();
    }

    //删除功能函数
    function deleteMovie(id,name) {
        var bo = confirm("您是否要删除<<"+name+">>电影吗");
        if(bo){
            location.href = "${pageContext.request.contextPath}/movie/delete-movie?id="+id;
        }
    }
</script>
</html>
