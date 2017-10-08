<%--
  Created by IntelliJ IDEA.
  User: wxz
  Date: 17-10-7
  Time: 上午1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户界面</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-image:url(${pageContext.request.contextPath}/image/left.jpg);
        }
    </style>
</head>
<body>
    <div>
        <ul>
            <li><a href="/homework/user/userinfo" target="right">个人信息</a></li>
            <li><a href="/homework/item/itemList" target="right">任务大厅</a></li>
            <li><a href="/homework/item/myItem" target="right">我的任务</a></li>
        </ul>
    </div>
</body>
</html>
