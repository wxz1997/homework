<%--
  Created by IntelliJ IDEA.
  User: wxz
  Date: 17-10-6
  Time: 下午3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form action="/homework/user/login" method="post">
        <div>
            用户名：<input type="text" id="username" name="username">
        </div>
        <div>
            密码：<input type="password" id="password" name="password">
        </div>
        <div>
            ${message}
        </div>

        <div>
            <input type="submit" value="提交" >
            <a href="register">还没有帐号？点此注册</a>
        </div>


    </form>
</body>
</html>
