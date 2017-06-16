package control;

import model.Login;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.LinkedList;

/**
 * Created by dpzain on 2017/6/14.
 */
public class HandleBuyGoods extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }catch (Exception e){}
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String buyGoodsMess=req.getParameter("buy");
        if(buyGoodsMess==null||buyGoodsMess.length()==0){
            fail(req,resp,"购物车空空如也不下订单哦");
            return;
        }
        String price=req.getParameter("price");
        if(price==null||price.length()==0){
            fail(req,resp,"没有计算价格和，无法形成订单");
            return;
        }
        float sum=Float.parseFloat(price);
        Login loginBean=null;
        HttpSession session=req.getSession(true);
        try{
            loginBean=(Login)session.getAttribute("loginBean");
            if(loginBean.getLogname()==null||loginBean.getLogname().length()==0){
                resp.sendRedirect("login.jsp");
            }
        }catch (Exception exp){
            resp.sendRedirect("login.jsp");
        }
        String uri="jdbc:mysql://127.0.0.1/mobileshop?"+"user=root&password=root";
        Connection con;
        PreparedStatement sql;
        try{
            con= DriverManager.getConnection(uri);
            String insertCondition="insert into orderform values(?,?,?,?)";
            sql=con.prepareStatement(insertCondition);
            sql.setInt(1,0);
            sql.setString(2,loginBean.getLogname());
            sql.setString(3,buyGoodsMess);
            sql.setFloat(4,sum);
            sql.executeUpdate();
            LinkedList car=loginBean.getCar();
            car.clear();
            success(req,resp,"生成订单成功");
        }catch (Exception exp){
            fail(req,resp,"生成订单失败"+exp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    private void success(HttpServletRequest req, HttpServletResponse resp, String backNews) {
        resp.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out=resp.getWriter();
            out.println("<html><body>");
            out.println("<h2>"+backNews+"<h2>");
            out.println("返回主页");
            out.println("<a href=index.jsp>主页</a>");
            out.println("<br>查看订单");
            out.println("<a href=lookOrderForm.jsp>查看订单</a>");
            out.println("</body></html>");
        }catch (IOException e){}
    }

    private void fail(HttpServletRequest req, HttpServletResponse resp, String backNews) {
        resp.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out=resp.getWriter();
            out.println("<html><body>");
            out.println("<h2>"+backNews+"<h2>");
            out.println("返回主页");
            out.println("<a href=index.jsp>主页</a>");
            out.println("</body></html>");
        }catch (IOException e){}
    }
}
