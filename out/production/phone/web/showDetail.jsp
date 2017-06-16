<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/14
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="loginBean" class="model.Login" scope="session"/>
<html>
<head>
    <title>商品详情</title>
</head>
<body>
<header id="header">
    <%@include file="head.txt"%>
</header>
<%
    if(loginBean==null){
        response.sendRedirect("login.jsp");
    }else {
        if(loginBean.getLogname()==null||loginBean.getLogname().length()==0)
            response.sendRedirect("login.jsp");
    }
    String mobileID=request.getParameter("xijie");
    out.print("<th>产品号"+mobileID);
    if(mobileID==null){
        out.print("没有产品号，无法查看详情");
        return;
    }
    Connection con;
    Statement sql;
    ResultSet rs;
    try{
       Class.forName("com.mysql.jdbc.Driver");
    }catch (Exception e){}
    String uri="jdbc:mysql://127.0.0.1/mobileshop?"+"user=root&password=root";
    try {
        con= DriverManager.getConnection(uri);
        sql=con.createStatement();
        String cdn="select * from mobileform where mobile_version='"+mobileID+"'";
        rs=sql.executeQuery(cdn);
        out.print("<table border=2>");
        out.print("<tr>");
        out.print("<th>产品号</th>");
        out.print("<th>名称</th>");
        out.print("<th>制造商</th>");
        out.print("<th>价格</th>");
        out.print("<th><font color=blue>加入购物车</font></th>");
        out.print("</tr>");
        String picture="welcome.jpg";
        String detailMess="";
        while (rs.next()){
            String number=rs.getString(1);
            String name=rs.getString(2);
            String maker=rs.getString(3);
            String price=rs.getString(4);
            detailMess=rs.getString(5);
            picture=rs.getString(6);
            String goods = "(" + number + "," + maker + "," + name + "," + price + ")#" + price;
            goods = goods.replaceAll("\\p{Blank}", "");
            String button = "<form action='putGoodsServlet' method='post'>" +
                    "<input type='hidden' name='java' value=" + goods + ">" +
                    "<input type='submit' value='加入购物车'></form>";
            out.print("<tr>");
            out.print("<td>" + number + "</td>");
            out.print("<td>" + name + "</td>");
            out.print("<td>" + maker + "</td>");
            out.print("<td>" + price + "</td>");
            out.print("<td>" + button + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        out.print("产品详情:<br>");
        out.println("<div align=center>"+detailMess+"<div>");
        String pic="<img src='images/"+picture+"'width=260 height=200></img>";
        out.print(pic);
        con.close();
    }catch (SQLException exp){

    }
%>
</body>
</html>
