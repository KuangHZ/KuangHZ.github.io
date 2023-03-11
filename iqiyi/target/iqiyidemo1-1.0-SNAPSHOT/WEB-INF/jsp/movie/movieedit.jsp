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
            修改电影信息
        </div>
        <ol class="am-breadcrumb">
            <li><a href="" class="am-icon-home">电影信息</a></li>
<%--            <li><a href="#">表单</a></li>--%>
            <li class="am-active">电影修改</li>
        </ol>
        <div class="tpl-portlet-components">

            <div class="tpl-block">

                <div class="am-g">
                    <div class="tpl-form-body tpl-form-line">
                        <form class="am-form tpl-form-line-form" action="${pageContext.request.contextPath}/movie/edit-movie" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${movie.id}">
                            <!-- 这是一个input开始 -->
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">电影名称 <span class="tpl-form-line-small-title">Name</span></label>
                                <div class="am-u-sm-9">
                                    <input name="moviename" value="${movie.moviename}" type="text" class="tpl-form-input" id="user-name" placeholder="请输入电影名称">
                                    <small></small>
                                </div>
                            </div>
                            <!-- 这是一个input结束 -->

                            <div class="am-form-group">
                                <label class="am-u-sm-3 am-form-label">时长 <span class="tpl-form-line-small-title">Time</span></label>
                                <div class="am-u-sm-9">
                                    <input name="time" value="${movie.time}" type="text" class="am-form-field tpl-form-no-bg" placeholder="电影时长" />
                                    <small></small>
                                </div>
                            </div>

                            <!-- 这是一个input开始 -->
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">电影播放路径 <span class="tpl-form-line-small-title">Url</span></label>
                                <div class="am-u-sm-9">
                                    <input name="url" value="${movie.url}" type="text" class="tpl-form-input" id="url" placeholder="请输入电影播放路径">
                                    <small></small>
                                </div>
                            </div>
                            <!-- 这是一个input开始 -->
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">图片路径 <span class="tpl-form-line-small-title">ImagePath</span></label>
                                <div class="am-u-sm-9">
                                    <input name="imagepath" value="${movie.imagepath}" type="text" class="tpl-form-input" id="imagepath" placeholder="请输入电影图片路径">
                                    <small></small>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label class="am-u-sm-3 am-form-label">导演 <span class="tpl-form-line-small-title">Director</span></label>
                                <div class="am-u-sm-9">
                                    <input name="director" value="${movie.moviedetailtable.director}" type="text" placeholder="输入导演名字">
                                </div>
                            </div>

                            <!--这是一个file控件开始-->
                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">电影封面图 <span class="tpl-form-line-small-title">Images</span></label>
                                <div class="am-u-sm-9">
                                    <div class="am-form-group">
                                        <div class="tpl-form-file-img">
                                            <img src="${pageContext.request.contextPath}${movie.saveimagepath}" alt="">
                                        </div>
                                        <input name="files" id="doc-form-file" type="file" class="am-btn am-btn-sm">
                                    </div>

                                </div>
                            </div>
                            <!--这是一个file控件结束-->

                            <div class="am-form-group">
                                <label class="am-u-sm-3 am-form-label">评分 <span class="tpl-form-line-small-title">Score</span></label>
                                <div class="am-u-sm-9">
                                    <input name="score" value="${movie.score}" type="text" placeholder="输入评分">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label class="am-u-sm-3 am-form-label">关键字 <span class="tpl-form-line-small-title">Keyword</span></label>
                                <div class="am-u-sm-9">
                                    <textarea name="keyword" class="" rows="10" id="keyword" placeholder="请输入关键字">${movie.moviedetailtable.keyword}</textarea>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">添加分类 <span class="tpl-form-line-small-title">Categroy</span></label>
                                <div class="am-u-sm-9">
                                    <input name="categroy" value="${movie.moviedetailtable.categroy}" type="text" id="user-weibo" placeholder="请添加分类用点号隔开">
                                    <div>

                                    </div>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-intro" class="am-u-sm-3 am-form-label">电影描述</label>
                                <div class="am-u-sm-9">
                                    <textarea name="des" class="" rows="10" id="user-intro" placeholder="请输入描述内容">${movie.moviedetailtable.des}</textarea>
                                </div>
                            </div>

                            <!--这是一个单选按钮开始-->
                            <div class="am-form-group">
                                <label for="user-intro" class="am-u-sm-3 am-form-label">电影状态</label>
                                <div class="am-u-sm-9">
                                    <div>
                                        <c:choose>
                                            <c:when test="${movie.status == 1}">
                                                <input name="status" value="1" type="radio" class="ios-switch tpl-switch-btn" checked />上架
                                                <input name="status" value="0" type="radio" class="ios-switch tpl-switch-btn"/>下架
                                            </c:when>
                                            <c:otherwise>
                                                <input name="status" value="1" type="radio" class="ios-switch tpl-switch-btn"/>上架
                                                <input name="status" value="0" type="radio" class="ios-switch tpl-switch-btn" checked/>下架
                                            </c:otherwise>
                                        </c:choose>

                                        <div class="tpl-switch-btn-view">
                                            <div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!--这是一个单选按钮结束-->

                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>


        </div>










    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/iscroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>

</html>
