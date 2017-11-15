package classinfo;
import org.apache.struts2.ServletActionContext;
import cn.itcast.shop.user.vo.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class classinfo
{
    private	String	teachname;
    private	String   grade;
    private String   productname;
    private  String  is_hot;
    public String getProductname()
    {
        return productname;
    }
    public void setProductname(String productname)
    {
        this.productname = productname;
    }
    public String getTeachname()
    {
        return teachname;
    }
    public void setTeachname(String teachname)
    {
        this.teachname = teachname;
    }
    public String getGrade()
    {
        return grade;
    }
    public void setGrade(String grade)
    {
        this.grade = grade;
    }
    public String getIs_hot()
    {
        return is_hot;
    }
    public void setIs_hot(String is_hot)
    {
        this.is_hot = is_hot;
    }



}