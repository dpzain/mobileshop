package control;

import com.sun.rowset.CachedRowSetImpl;
import model.DataByPage;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 *
 * Created by dpzain on 2017/6/14.
 */
public class QueryAllRecord extends HttpServlet {
    CachedRowSetImpl rowSet=null;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("con.mysql.jdbc.Driver");
        }catch (Exception e){}
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String idNumber=req.getParameter("fenleiNumber");
        if(idNumber==null){
            idNumber="0";
        }
        int id=Integer.parseInt(idNumber);
        HttpSession session=req.getSession(true);
        Connection con;
        DataByPage dataBean=null;
        try{
            dataBean=(DataByPage)session.getAttribute("dataBean");
            if(dataBean==null)
                dataBean=new DataByPage();
            session.setAttribute("dataBean",dataBean);
        }catch (Exception exp){
            dataBean=new DataByPage();
            session.setAttribute("dataBean",dataBean);
        }

        String uri="jdbc:mysql://127.0.0.1/mobileshop?"+"user=root&password=root";
        try {
            con= DriverManager.getConnection(uri);
            Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs=sql.executeQuery("SELECT  * FROM mobileform WHERE id="+id);
            rowSet=new CachedRowSetImpl();
            rowSet.populate(rs);
            dataBean.setRowSet(rowSet); //行集对象储存在dataBean中
            con.close();
        }catch (SQLException exp){
            exp.printStackTrace();
            resp.setContentType("text/html;charset=utf-8");
            PrintWriter out=resp.getWriter();
            out.println("<html><body>");
            out.println("<h1>shibai</h1>");
            out.println("</html></body>");
        }
        resp.sendRedirect("byPageShow.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
