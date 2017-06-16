<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/14
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="loginBean" class="model.Login" scope="session"/>
<html>
<head>
    <title>购物车</title>
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
        LinkedList car=loginBean.getCar();
        if(car==null)
            out.print("<h2>购物车空空如也.</h2>");
        else {
            Iterator<String> iterator=car.iterator();
            StringBuffer buyGoods=new StringBuffer();
            int n=0;
            double priceSum=0;
            out.print("购物车中的物品：<table border=2>");
            while (iterator.hasNext()){
                String goods=iterator.next();
                String showGoods="";
                n++;
                int index=goods.lastIndexOf("#");
                if(index!=-1){
                    priceSum+=Double.parseDouble(goods.substring(index+1));
                    showGoods=goods.substring(0,index);
                }
                buyGoods.append(n+":"+showGoods);
                String del="<form action='deleteServlet' method='post'>"+
                        "<input type='hidden' name='delete' value="+goods+">"+
                        "<input type='submit' value='删除'></form>";
                out.print("<tr><td>"+showGoods+"</td>");
                out.print("<td>"+del+"</td></tr>");
            }
            out.print("</table>");
            String orderForm="<form action='buyServlet' method='post'>"+
                    "<input type='hidden' name='buy' value="+buyGoods+">"+
                    "<input type='hidden' name='price' value="+priceSum+">"+
                    "<input type='submit' value='下订单'></form>";
            out.print(orderForm);
        }
    %>
</div>
</body>
</html>
