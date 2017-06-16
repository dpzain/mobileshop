<%@ page import="com.sun.rowset.CachedRowSetImpl" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/13
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dataBean" class="model.DataByPage" scope="session"/>
<html>
<head>
    <title>同品牌所有手机</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/index.css" />
</head>
<body>
<header id="header">
    <%@include file="head.txt"%>
</header>
<br>所有产品：<br>
<table border="2">
    <tr>
        <th>手机型号</th>
        <th>手机名称</th>
        <th>制造商</th>
        <th>价格</th>
        <th>查看详情</th>
        <td><font color="aqua">添加到购物车</font></td>
    </tr>
    <jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
    <jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
    nihao<jsp:getProperty name="dataBean" property="currentPage"/>
    <%
        CachedRowSetImpl rowSet = dataBean.getRowSet();
        if (rowSet == null) {
            out.print("没有查询到任何信息，无法浏览");
            return;
        }
        rowSet.last();
        int totalRecord = rowSet.getRow(); //全部记录数

        out.print("全部记录数" + totalRecord);
        int pageSize = dataBean.getPageSize();//每页显示记录数
        int totalPages; //总页数
        if (totalRecord % pageSize == 0)
            totalPages = totalRecord / pageSize;
        else
            totalPages = totalRecord / pageSize + 1;
        dataBean.setPageSize(pageSize);
        dataBean.setTotalPage(totalPages);
        if (totalPages >= 1) {
            if (dataBean.getCurrentPage() < 1) {
                dataBean.setCurrentPage(dataBean.getTotalPage());
            }
            if (dataBean.getCurrentPage() > dataBean.getTotalPage())
            {
                dataBean.setCurrentPage(1);
            }
            rowSet.absolute((dataBean.getCurrentPage() - 1) * dataBean.getPageSize()+1);//查询位置移动到currentPage页面起始位置开始显示
            boolean boo = true;
            for (int i = 1; i <= pageSize && boo; i++) {
                String number = null;
                String name = null;
                String maker = null;
                String price = null;
                try {
                    number = rowSet.getString(1);
                    name = rowSet.getString(2);
                    maker = rowSet.getString(3);
                    price = rowSet.getString(4);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                String goods = "(" + number + "," + maker + "," + name + "," + price + ")#" + price;
                goods = goods.replaceAll("\\p{Blank}", "");
                String button = "<form action='putGoodsServlet' method='post'>" +
                        "<input type='hidden' name='java' value=" + goods + ">" +
                        "<input type='submit' value='加入购物车'></form>";
                String detail = "<form action='showDetail.jsp' method='post'>" +
                        "<input type='hidden' name='xijie' value=" + number + ">" +
                        "<input type='submit' value='查看详情'></form>";
                out.print("<tr>");
                out.print("<td>" + number + "</td>");
                out.print("<td>" + name + "</td>");
                out.print("<td>" + maker + "</td>");
                out.print("<td>" + price + "</td>");
                out.print("<td>" + detail + "</td>");
                out.print("<td>" + button + "</td>");
                out.print("</tr>");
                boo = rowSet.next();
            }
        }
    %>
</table>
<br>每页最多显示：
<jsp:getProperty name="dataBean" property="pageSize"/>
条信息
<br>当前显示第
<jsp:getProperty name="dataBean" property="currentPage"/>
页，
共有
<jsp:getProperty name="dataBean" property="totalPage"/>
页。

<form action="" method="post">
    <input type="hidden" name="currentPage" value="<%=dataBean.getCurrentPage()-1%>">
    <input type="submit" name="g" value="上一页">
</form>
test<%=dataBean.getCurrentPage()%>
<form action="" method="post">
    <input type="hidden" name="currentPage" value="<%=dataBean.getCurrentPage()+1%>">
    <input type="submit" name="g" value="下一页">
</form>
<form action="" method="post">
    每页显示 <input type="text" name="pageSize" value="2" size="3">条记录
    <input type="submit" name="g" value="确定">
</form>
<%--<form action="" method="post">
    输入页码 <input type="text" name="currentPage" value="2" size="3">
    <input type="submit" name="g" value="确定">
</form>--%>
</body>
</html>
