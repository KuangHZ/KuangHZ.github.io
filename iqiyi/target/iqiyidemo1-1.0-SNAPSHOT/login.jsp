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
</head>

<body data-type="login">
<c:if test="${flag != null && flag == '1'}">
    <script type="text/javascript">
        alert("用户名或者密码有误");
    </script>
</c:if>
<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                爱电影<span> 登录</span> <i class="am-icon-skyatlas"></i>

            </div>
        </div>

        <div class="login-font">
            <i>登录 </i> or <span> 注册</span>
        </div>
        <div class="am-u-sm-10 login-am-center">
            <form class="am-form" action="${pageContext.request.contextPath}/user/login" method="post">
                <fieldset>
                    <div class="am-form-group">
                        <input name="username" type="text" class="" id="doc-ipt-email-1" placeholder="输入用户名称">
                    </div>
                    <div class="am-form-group">
                        <input name="password" type="password" class="" id="doc-ipt-pwd-1" placeholder="输入密码">
                    </div>
                    <p>
                        <button type="submit" class="am-btn am-btn-default">登录</button>
                    </p>
                    <p>
                        <a href="${pageContext.request.contextPath}/user/show-register" class="am-btn am-btn-default">注册</a>
                    </p>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>

</html>
