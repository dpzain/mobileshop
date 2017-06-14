<%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/13
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="loginBean" class="model.Login" scope="session"/>
<html>
<head>
    <title>登录界面</title>
</head>
<body>
<form action="loginServlet">
    用户名：<input type="text" name="logname"><br>
    密码：<input type="password" name="password">
    <input type="submit" value="登录">
</form>


<jsp:getProperty name="loginBean" property="logname"/><br>
<jsp:getProperty name="loginBean" property="backNews"/>
</body>
</html>
