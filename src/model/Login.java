package model;

import java.util.LinkedList;

/**
 * 登录control
 * Created by dpzain on 2017/6/13.
 */
public class Login {
    private String logname="",backNews="未登录";
    LinkedList<String> car;

    public Login() {
       car=new LinkedList<>();
    }

    public String getLogname() {
        return logname;
    }

    public void setLogname(String logname) {
        this.logname = logname;
    }

    public String getBackNews() {
        return backNews;
    }

    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }

    public LinkedList<String> getCar() {
        return car;
    }
}
