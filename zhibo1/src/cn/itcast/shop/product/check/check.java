package cn.itcast.shop.product.check;
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
import cn.itcast.shop.product.check.date;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.transform.Result;

public class check {
    public  ArrayList<date> hashcode(Integer ss){
        ArrayList<date> team = new ArrayList<date>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            //如果有异常就抛出
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            PreparedStatement st = conn.prepareStatement("select pid from class_uid where uid="+ss);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                date e = new date();
                e.setPid(Integer.parseInt(rs.getString("pid")));
                team.add(e);
            }
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
        return team;
    }
}
