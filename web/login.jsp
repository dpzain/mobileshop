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
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <style>
        .form_wrapper{
            margin-top: 20px;
            width: 500px;
            margin: 0 auto;
        }
       h3{
           height: 90px;
           background-color: #333333;
           line-height: 90px;
           text-align: center;
           color: #FFFFFF;
           font-family: "Helvetica Neue", Helvetica, Arial, "Microsoft Yahei UI", "Microsoft YaHei", SimHei, "宋体", simsun, sans-serif;
           font-size: 30px;
       }
        form>div{
            margin-top: 20px;
        }
         form>div>input{
             width: 60%;
             height: 40px;
             border: 1px solid #dddddd;

         }
        label{
            font-weight: 600;
            font-size: 17px;
        }
        .bottom{
            height: 90px;
            background-color: #333333;
            text-align: right;
        }
        .bottom input{
            width: 150px;
            height: 44px;
            background-color: #d9d9d9;
            color: #333333;
            font-weight: 600;
            border-radius: 4px;
            margin-top: 20px;
        }
        .bottom a{
            color:orange;
        }
    </style>
</head>
<body>
<header id="header">
    <%@include file="head.txt" %>
</header>

<div class="form_wrapper" id="for_wrapper">
    <form action="loginServlet" class="login">

        <h3>Login</h3>

        <div class="top">

            <label>用户名:</label>
            <br>
            <input type="text" name="logname"/>


        </div>

        <div class="middle">

            <label>密码: </label>
            <br>

            <input type="password" name="password"/>


        </div>

        <div class="bottom">


            <input type="submit" value="登录"/>
            <br>
            <a href="inputRegisterMess.jsp" class="linkform">还没有账号，点击注册</a>

            <div class="clear"></div>

        </div>

    </form>
</div>

<jsp:getProperty name="loginBean" property="logname"/>
<br>
<jsp:getProperty name="loginBean" property="backNews"/>
</body>
</html>
