<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
</head>
<body>
<c:forEach items="${users}" var="user">
    <p>${user.id}--${user.username}--${user.password}--${user.limit}</p>
</c:forEach>
</body>
</html>
