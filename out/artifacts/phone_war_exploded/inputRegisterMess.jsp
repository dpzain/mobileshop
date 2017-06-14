<%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/13
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userBean" class="model.Register" scope="request"/>
<html>
<head>
    <title>注册页面</title>
</head>
<body>
<form action="registerServlet">
    用户名：<input type="text" name="logname"><br>
    用户密码：<input type="password" name="password"><br>
    确认密码：<input type="password" name="again_password"><br>
    邮箱：<input type="email" name="email"><br>
    电话：<input type="text" name="phone"><br>
    地址：<input type="text" name="address"><br>
    <input type="submit" value="提交">

</form>
<jsp:getProperty name="userBean" property="backNews"/>
<jsp:getProperty name="userBean" property="logname"/><br>
<jsp:getProperty name="userBean" property="address"/>
</body>
</html>
