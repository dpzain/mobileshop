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
<<<<<<< HEAD
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header id="header">
    <%@include file="head.txt" %>
</header>
<div class="content">
    <div class="form_wrapper">
        <form action="registerServlet" class="register active">

            <h3>Register</h3>

            <div class="column">

                <div>

                    <label>用户名:</label>

                    <input type="text" name="logname">


                </div>

                <div>

                    <label>密码:</label>

                    <input type="password" name="password"><br>


                </div>

                <div>

                    <label>确认密码:</label>

                    <input type="password" name="again_password">


                </div>

            </div>

            <div class="column">

                <div>

                    <label>邮箱:</label>

                    <input type="text" name="email">


                </div>

                <div>

                    <label>电话:</label>

                    <input type="text" name="phone">


                </div>

                <div>

                    <label>地址:</label>

                    <input type="text" name="address"/>


                </div>

            </div>

            <div class="bottom">

                <!--<div class="remember">

                    <input type="checkbox" />

                    <span>Send me updates</span>

                </div>-->

                <input type="submit" value="注册"/>

                <a href="login.jsp" class="linkform">已有账号，点击登录</a>

                <div class="clear"></div>

            </div>

        </form>
    </div>
</div>
<jsp:getProperty name="userBean" property="backNews"/>
<jsp:getProperty name="userBean" property="logname"/>
<br>
=======
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
>>>>>>> 745c1e38ee76aa8ef22bc5416e03d6060497dc19
<jsp:getProperty name="userBean" property="address"/>
</body>
</html>
