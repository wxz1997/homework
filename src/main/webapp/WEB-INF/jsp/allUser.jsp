<%--
  Created by IntelliJ IDEA.
  User: wxz
  Date: 17-10-7
  Time: 上午1:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!--引入自定义的分页标签-->
<%@ taglib uri="/pager-tags" prefix="fkjava" %>
<html>
<head>
    <title>用户查询</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="/homework/user/allUser">
    <div>
        帐号：<input type="text" name="username" id="username">
        昵称：<input type="text" name="nickname" id="nickname">
        邮箱：<input type="text" name="email" id="email">
        学院：<input type="text" name="college" id="college">
        <br>
        年级：<input type="text" name="grade" id="grade">
        专业：<input type="text" name="major" id="major">
        班级：<input type="text" name="classes" id="classes">
        方向:<input type="text" name="area" id="area">
        <input type="submit" value="查询">
    </div>
</form>

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <td><input type="checkbox" name="checkAll" id="checkAll"></td>
        <th>帐号</th>
        <th>昵称</th>
        <th>邮箱</th>
        <th>学院</th>
        <th>年级</th>
        <th>专业</th>
        <th>班级</th>
        <th>方向</th>
        <th>任务情况</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${allUser}" var="user" varStatus="stat">
        <tr>
            <td><input type="checkbox" id="${stat.index}" value="${user.userId}"></td>
            <td>${user.username}</td>
            <td>${user.nickname}</td>
            <td>${user.email}</td>
            <td>${user.college}</td>
            <td>${user.grade}</td>
            <td>${user.major}</td>
            <td>${user.classes}</td>
            <td>${user.area}</td>
            <td><a href="/homework/item/seeone?id=${user.userId}">查看</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- 分页标签 -->
<fkjava:pager pageIndex="${pageModel.pageIndex}"
              pageSize="${pageModel.pageSize}"
              recordCount="${pageModel.recordCount}"
              style="digg"
              submitUrl="/homework/user/allUser?pageIndex={0}"/>

</body>
</html>
