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
import java.util.LinkedList;

/**
 *
 *
 * Created by dpzain on 2017/6/14.
 */
public class PutGoodsToCar extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String goods=req.getParameter("java");
        System.out.println(goods);
        Login loginBean=null;
        HttpSession session=req.getSession(true);
        try{
            loginBean=(Login)session.getAttribute("loginBean");
            if(loginBean.getLogname()==null||loginBean.getLogname().length()==0)
                resp.sendRedirect("login.jsp");
            LinkedList<String> car=loginBean.getCar();
            car.add(goods);
            speakSonmeMess(req,resp,goods);
        }catch (Exception e){}
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    private void speakSonmeMess(HttpServletRequest req, HttpServletResponse resp, String goods) {
        resp.setContentType("text/html;charset=UTF-8");
        try{
            PrintWriter out=resp.getWriter();
            out.print("<%@include file='head.txt'%>");
            out.print("<html><body>");
            out.print("<h2>"+goods+"放入购物车成功</h2>");
            out.print("查看购物车或返回<br>");
            out.print("<a href=lookShoppingCar.jsp>查看购物车</a>");
            out.print("<br><a href=byPageShow.jsp>主页</a>");
            out.print("</body></html>");
        }catch (IOException e){}
    }
}
