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
    <title>任务查询</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="/homework/item/allItem">
    <div>
        任务名称：<input type="text" name="itemName" id="itemName">
        简介：<input type="text" name="introduction" id="introduction">
        状态：<select name="status">
        <option value="" ></option>
        <option value="0">未领取</option>
        <option value="1">已领取</option>
    </select>
        <input type="submit" value="查询">
    </div>

</form>
<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <td><input type="checkbox" name="checkAll" id="checkAll"></td>
        <th>任务名称</th>
        <th>简介</th>
        <th>发布人</th>
        <th>发布时间</th>
        <th>接受人</th>
        <th>接收时间</th>
        <th>附件下载</th>
        <th>状态</th>
        <th>是否完成</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${allItem}" var="item" varStatus="stat">
        <tr>
            <td><input type="checkbox" id="${stat.index}" value="${item.itemId}"></td>
            <td>${item.itemName }</td>
            <td>${item.introduction }</td>
            <td>${item.createUser.nickname }</td>
            <td><fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${item.receviedUser.nickname}</td>
            <td><fmt:formatDate value="${item.receviedTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <c:choose>
                <c:when test="${item.fileName != null}">
                <a href="/homework/item/downLoad?id=${item.itemId }">下载
                    </c:when>
                    <c:otherwise>无</c:otherwise>
                    </c:choose>
            </td>

            <td>
                <c:choose>
                    <c:when test="${item.status == 0}">未领取</c:when>
                    <c:otherwise>已领取</c:otherwise>
                </c:choose>
            </td>
            <td>
                <c:choose>
                    <c:when test="${item.success == 0}">未完成</c:when>
                    <c:otherwise>已完成</c:otherwise>
                </c:choose>
            </td>

            <td><a href="/homework/item/toUpdateItem?id=${item.itemId}">修改</a>&nbsp;&nbsp;
                <a href="/homework/item/deleteItem?id=${item.itemId}">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- 分页标签 -->
<fkjava:pager pageIndex="${pageModel.pageIndex}"
              pageSize="${pageModel.pageSize}"
              recordCount="${pageModel.recordCount}"
              style="digg"
              submitUrl="/homework/item/allItem?pageIndex={0}"/>

</body>
</html>
