<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/27/027
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<frameset rows="25%,*" frameborder="0">
    <frame src="${pageContext.request.contextPath}/user/toTop.controller" scrolling="no">
    <frameset cols="20%,*" frameborder="0">
        <frame src="${pageContext.request.contextPath}/user/toLeft.controller" scrolling="no">
        <frame src="${pageContext.request.contextPath}/user/toRight.controller" name="right" scrolling="no">
    </frameset>
</frameset>
<body>

登录成功
</body>
</html>
