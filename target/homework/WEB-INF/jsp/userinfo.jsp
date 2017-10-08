<%--
  Created by IntelliJ IDEA.
  User: wxz
  Date: 17-10-7
  Time: 下午3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div>帐号：${user.username}</div>
    <div>昵称：${user.nickname}</div>
    <div>邮箱：${user.email}</div>
    <div>学院：${user.college}</div>
    <div>年级：${user.grade}</div>
    <div>专业：${user.major}</div>
    <div>班级：${user.classes}</div>
    <div>方向：${user.area}</div>
</body>
</html>
