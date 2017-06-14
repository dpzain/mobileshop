package control;

import model.Register;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by dpzain on 2017/6/13.
 */
public class HandleRegister extends HttpServlet{
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    private String handleString(String s) {
        try {
            s = new String(s.getBytes("iso-8859-1"), "utf-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri="jdbc:mysql://127.0.0.1/mobileshop?"+"user=root&password=root&characterEncoding=utf-8";
        Connection con;
        PreparedStatement sql;
        Register userBean=new Register();
        req.setAttribute("userBean",userBean);
        String logname=req.getParameter("logname").trim();
        String password=req.getParameter("password").trim();
        String again_password=req.getParameter("again_password").trim();
        String email=req.getParameter("email").trim();
        String phone=req.getParameter("phone").trim();
        String address=req.getParameter("address").trim();
       /* if(logname==null)
            logname="";
        if(password==null)
            password="";*/
        if(!password.equals(again_password)){
            userBean.setBackNews("两次密码不一致，注册失败！");
            req.getRequestDispatcher("inputRegisterMess.jsp").forward(req,resp);
           // return;
        }
        boolean isLD=true;
        for(int i=0;i<logname.length();i++){
            char c=logname.charAt(i);
            if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
                isLD=false;
        }
        boolean boo=logname.length()>0&&password.length()>0&&isLD;
        String backNews;
        try{
            con= DriverManager.getConnection(uri);
            String insertCondition="insert into user values(?,?,?,?,?)";
            sql=con.prepareStatement(insertCondition);
            if(boo){
                sql.setString(1,logname);
                sql.setString(2,password);
                sql.setString(3,email);
                sql.setString(4,phone);
                sql.setString(5,address);
                int m=sql.executeUpdate();
                if(m!=0){
                    backNews="注册成功";
                    userBean.setBackNews(backNews);
                    userBean.setLogname(logname);
                    userBean.setEmail(email);
                    userBean.setPhone(phone);
                    userBean.setAddress(address);
                }else {
                    backNews="不知什么原因，注册失败";
                    userBean.setBackNews(backNews);
                }
            }else {
                backNews="填写信息不完整或名字中含有非法字符";
                userBean.setBackNews(backNews);
            }
            con.close();
        }catch (SQLException exp){
            backNews="该会员名已被使用"+exp;
            userBean.setBackNews(backNews);
        }
        req.getRequestDispatcher("inputRegisterMess.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
