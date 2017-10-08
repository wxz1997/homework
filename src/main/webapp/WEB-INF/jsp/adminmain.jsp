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
    <title>管理员界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        body {
            background-image:url(${pageContext.request.contextPath}/image/left.jpg);
        }
    </style>
</head>
<body>
    <div>
        <ul>
            <li><a href="/homework/user/allUser" target="right">用户管理</a></li>
            <li>任务管理</li>
            <ul>
                <li><a href="/homework/item/allItem" target="right">任务查询</a></li>
                <li><a href="addItem" target="right">发布任务</a></li>
            </ul>

        </ul>
    </div>
</body>
</html>
