<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/27/027
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="base.jsp"/>
</head>
<body>
<div class="container">
    <div class="span3">
        <div class="well sidebar-nav">
            <ul class="nav nav-list">
                <li class="navbar-header"></li>
                <li>
                    <a href="${pageContext.request.contextPath}/grade/doListGrade.controller" target="right">班级管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/student/doListStudent.controller" target="right">学生管理</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
