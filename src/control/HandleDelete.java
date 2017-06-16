package control;

import model.Login;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by dpzain on 2017/6/14.
 */
public class HandleDelete extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String delete=req.getParameter("delete");
        Login loginBean=null;
        HttpSession session=req.getSession(true);
        try{
            loginBean=(Login)session.getAttribute("loginBean");
            if(loginBean.getLogname()==null||loginBean.getLogname().length()==0)
                resp.sendRedirect("login.jsp");
            LinkedList<String> car=loginBean.getCar();
            car.remove(delete);
        }catch (Exception exp){
            resp.sendRedirect("login.jsp");
        }
        req.getRequestDispatcher("lookShoppingCar.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
