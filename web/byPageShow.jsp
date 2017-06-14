<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/13
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.txt"%>
<html>
<head>
    <title>同品牌所有手机</title>
</head>
<body><br>所有产品：<br>
<table border="2">
    <tr>
        <th>手机型号</th>
        <th>手机名称</th>
        <th>制造商</th>
        <th>价格</th>
        <th>查看详情</th>
        <td><font color="aqua">添加到购物车</font></td>
    </tr>
    <jsp:getProperty name="dataBean" property="pageSize" param="pageSize"/>
    <jsp:getProperty name="dataBean" property="currentPage" param="currentPage"/>
    <%

    %>
</table>
<%--<div align="center">
    <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (Exception e){}
        String uri="jdbc:mysql://127.0.0.1/mobileshop?"+"user=root&password=root";
        Connection con;
        Statement sql;
        ResultSet rs;
        try{
            con= DriverManager.getConnection(uri);
            sql=con.createStatement();

        }
    %>--%>
</div>
</body>
</html>
