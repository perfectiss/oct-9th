<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/28/028
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>

  <style type="text/css">
    body {
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #f5f5f5;
    }
    .form-signin {
      max-width: 300px;
      padding: 19px 29px 29px;
      margin: 0 auto 20px;
      background-color: #fff;
      border: 1px solid #e5e5e5;
      -webkit-border-radius: 5px;
      -moz-border-radius: 5px;
      border-radius: 5px;
      -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
      -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
      box-shadow: 0 1px 2px rgba(0,0,0,.05);
    }
    .form-signin .form-signin-heading,
    .form-signin .checkbox {
      margin-bottom: 10px;
    }
    .form-signin input[type="text"],
    .form-signin input[type="password"] {
      font-size: 16px;
      height: auto;
      margin-bottom: 15px;
      padding: 7px 9px;
    }
  </style>

  <link
          rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-2.1.4.min.js"></script>
  <script
          type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js">
  </script>


</head>
<body>

<div class="container">
  <form class="form-signin" action="${pageContext.request.contextPath}/user/doLogin.controller" method="POST">
    <h2 class="form-signin-heading">欢迎登录</h2>
    <input type="text" class="input-block-level" name="userName" placeholder="用户名">
    <input type="password" class="input-block-level" name="password" placeholder="密码">
    <button class="btn btn-large btn-primary" type="submit">登录</button>
  </form>
</div>
<div>
  ${msg}
</div>

</body>
</html>
