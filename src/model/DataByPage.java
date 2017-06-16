package model;

import com.sun.rowset.*;

/**
 * control queryServlet把数据库查询到的记录到dataBean中
 * Created by dpzain on 2017/6/14.
 */
public class DataByPage {
        private CachedRowSetImpl rowSet=null;  //存储表中全部记录的行集对象
        private int pageSize=1;                //每页显示的记录数
        private int totalPage=1;               //分页后的总页数
        private int currentPage=1;             //当前显示页数

    public CachedRowSetImpl getRowSet() {
        return rowSet;
    }

    public void setRowSet(CachedRowSetImpl rowSet) {
        this.rowSet = rowSet;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
}
