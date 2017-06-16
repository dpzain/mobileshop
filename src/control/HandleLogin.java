package control;

import model.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.*;

/**
 *
 * Created by dpzain on 2017/6/13.
 */
public class HandleLogin extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private String handleString(String s){
        try {
            s=new String(s.getBytes("iso-8859-1"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection con;
        Statement sql;
        String logname=req.getParameter("logname").trim(),
                password=req.getParameter("password").trim();
       /* logname=handleString(logname);
        password=handleString(password);*/
        String uri="jdbc:mysql://127.0.0.1/mobileshop?"+"user=root&password=root";
        boolean boo=(logname.length()>0)&&(password.length()>0);
        try {
            con= DriverManager.getConnection(uri);
            String condition="select * from user where logname='"+logname+"'and password='"+password+"'";
            sql=con.createStatement();
            if(boo){
                ResultSet rs=sql.executeQuery(condition);
                boolean m=rs.next();
                if(m){
                    //调用登录成功的方法,判断是否重复登录，更新创建登录数据模型
                    success(req,logname);
                    req.getRequestDispatcher("login.jsp").forward(req,resp);
                }else {
                    String backNews="你输入的用户名或密码不正确";
                    //调用登录失败的方法
                    fail(resp,logname,backNews);
                }
            }else {
                String backNews="请输入用户名和密码";
                fail(resp,logname,backNews);
            }
            con.close();
        } catch (SQLException e) {
            /*e.printStackTrace();
            resp.setContentType("text/html;charset=utf-8");
            PrintWriter out=resp.getWriter();
            out.println("<html><body>");
            out.println("<h1>链接数据库失败</h1>");
            out.println("</html></body>");*/
            String backNews=""+e;
            //fail();
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    private void success(HttpServletRequest req, String logname) {
        Login loginBean=null;
        HttpSession session=req.getSession(true);
        try{
            loginBean=(Login)session.getAttribute("loginBean");
            if(loginBean==null){
                loginBean=new Login();  //创建新的数据模型（没有任何用户登录，不是无数据模型，而是为空）
                session.setAttribute("looginBean",loginBean);
                loginBean=(Login)session.getAttribute("loginBean");
            }
            String name=loginBean.getLogname();
            if(name.equals(logname)){  //查看当前用户是否已经登录

                loginBean.setBackNews(logname+"已登录，无需再次登录");
                loginBean.setLogname(logname);
            }else {   //已有数据模型或新建的数据模型  储存新的登录用户
                loginBean.setLogname(logname);
                loginBean.setBackNews(logname+"登录成功");
            }
        }catch (Exception ee){
            loginBean=new Login();
            session.setAttribute("loginBean",loginBean);
            loginBean.setBackNews(logname+"登陆成功");
            loginBean.setLogname(logname);
        }
    }

    private void fail(HttpServletResponse resp, String logname, String backNews) {
        resp.setContentType("text/html;charset=utf-8");
        try {
            PrintWriter out=resp.getWriter();
            out.println("<html><body>");
            out.println("<h2>"+logname+"登录反馈结果<br>"+backNews+"</h2>");
            out.println("返回登录页面或首页<br>");
            out.println("<a href=login.jsp>登录页面</a>");
            out.println("</body></html>");
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

}
