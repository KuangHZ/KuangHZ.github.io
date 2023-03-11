<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                爱电影<span> 注册</span> <i class="am-icon-skyatlas"></i>

            </div>
        </div>

        <div class="login-font">
            <i>注册 </i> or
            <span> 登录</span>
        </div>
        <div class="am-u-sm-10 login-am-center">
            <%--使用spring的标签--%>
            <form:form class="am-form" id="registerForm" modelAttribute="user" method="post" action="${pageContext.request.contextPath}/user/save-register">
                <fieldset>
                    <div class="am-form-group">
                        <form:input path="username" class="" id="doc-ipt-email-1" placeholder="输入用户名称"></form:input>
                        <form:errors path="username" cssStyle="color: red;"></form:errors>
                    </div>
                    <div class="am-form-group">
                        <form:input path="password" type="password" class="" id="doc-ipt-pwd-1" placeholder="输入密码"></form:input>
                        <form:errors path="password" cssStyle="color: red;"></form:errors>
                    </div>
                    <div class="am-form-group">
                        <input type="password" class="" id="doc-ipt-pwd-2" placeholder="输入确认密码"><span id="truePwd" style="color: red;"></span>
                    </div>
                    <p>
                        <a id="registerBtn" class="am-btn am-btn-default">注册</a>
                    </p>
                    <p>
                        <a href="${pageContext.request.contextPath}/user/show-login" class="am-btn am-btn-default">登录</a>
                    </p>
                </fieldset>
            </form:form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
<script type="text/javascript">
    function check(){
        //对一次密码和二次确认密码进行判断，判断两次是否一致
        var p1 = $("#doc-ipt-pwd-1").val();
        var p2 = $("#doc-ipt-pwd-2").val();
        if(p1 != p2){
            $("#truePwd").text("两次密码不一致");
            return false;
        }else{
            $("#truePwd").text("");
            return true;
        }
    }
    //添加失去焦点事件
    $("#doc-ipt-pwd-2").blur(function () {
        check();
    });
    //注册按钮的敲击事件
    $("#registerBtn").click(function () {
        var bo = check();
        //当返回false时表示密码不一致，当返回true时表示一致
        if(bo){
            //发出注册请求---表单数据提交
            $("#registerForm").submit();
        }
    });
</script>
</html>
