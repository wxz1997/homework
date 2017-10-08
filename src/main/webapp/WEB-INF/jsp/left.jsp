<%--
  Created by IntelliJ IDEA.
  User: wxz
  Date: 17-10-7
  Time: 下午1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>管理栏</title>
</head>
<body>
    <c:choose>
        <c:when test="${sessionScope.user_session.rank == 1}">
            <jsp:forward page="adminmain.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:forward page="usermain.jsp"/>
        </c:otherwise>
    </c:choose>

</body>
</html>
