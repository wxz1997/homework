<%--
  Created by IntelliJ IDEA.
  User: wxz
  Date: 17-10-7
  Time: 上午1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改任务</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="/homework/item/updateItem" enctype="multipart/form-data" method="post">
    <input type="hidden" id="itemId" name="itemId" value="${item.itemId}">
    <div>
        名称：<input type="text" id="itemName" name="itemName" value="${item.itemName}">
    </div>
    <div>
        简介：<textarea name="introduction" id="introduction" cols="30" rows="10" value="${item.introduction}"></textarea>">
    </div>
    <div>
        更改附件：<input type="file" id="file" name="file">
    </div>

    <div>
        <input type="submit" value="提交">
    </div>

</form>
</body>
</html>
