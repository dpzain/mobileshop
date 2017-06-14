<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: dpzain
  Date: 2017/6/13
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选择不同类型手机</title>
</head>
<body>
<div align="center">
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            out.print(e+"错误");
        }
        String uri = "jdbc:mysql://127.0.0.1/mobileshop?" + "user=root&password=root";
        Connection con;
        Statement sql;
        ResultSet rs;
        try {
            con= DriverManager.getConnection(uri);
            sql=con.createStatement();
            rs=sql.executeQuery("SELECT * FROM mobileclassify");
            out.print("<form action='queryServlet' method='post'>");
            out.print("<select name='fenleiNumber'>");
            while(rs.next()){
                int id=rs.getInt(1);
                String mobileCategory=rs.getString(2);
                out.print("<option value="+id+">"+mobileCategory+"</option>");
            }
            out.print("</select>");
            out.print("<input type='submit' value='提交'>");
            out.print("</form>");
            con.close();
        }catch (SQLException e){
            out.print(e+"cuowu");
        }
    %>
</div>
</body>
</html>
