<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/14
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="loginBean" class="model.Login" scope="session"/>

<html>
<head>
    <title>我的订单</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/index.css" />
</head>
<body>
<header id="header">
    <%@include file="head.txt"%>
</header>
<div align="center">
    <%
        if(loginBean==null){
            response.sendRedirect("login.jsp");
        }else {
            if(loginBean.getLogname()==null||loginBean.getLogname().length()==0)
                response.sendRedirect("login.jsp");
        }
        Connection con;
        Statement sql;
        ResultSet rs;
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (Exception e){}
        try{
            String uri="jdbc:mysql://127.0.0.1/mobileshop?"+"user=root&password=root";
            con= DriverManager.getConnection(uri);
            sql=con.createStatement();
            String cdn="select id,mess,sum FROM orderform where logname='"+loginBean.getLogname()+"'";
            rs=sql.executeQuery(cdn);
            out.print("<table border=2>");
            out.print("<tr>");
                out.print("<th width=100>"+"订单号");
                out.print("<th width=100>"+"信息");
                out.print("<th width=100>"+"价格");
            out.print("</tr>");
            while (rs.next()){
                out.print("<tr>");
                out.print("<td>"+rs.getString(1)+"</td>");
                out.print("<td>"+rs.getString(2)+"</td>");
                out.print("<td>"+rs.getString(3)+"</td>");
                out.print("</tr>");
            }
        }catch (SQLException e){
            out.print(e);
        }
    %>
</div>
</body>
</html>
