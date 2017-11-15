package cn.itcast.shop.product.delect;
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
public class delect {
    public int hashcode(String ss){
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            //如果有异常就抛出
            classnotfoundexception.printStackTrace();
        }
        try {

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            String sql1 = "delete from product where pid ="+ss;
            PreparedStatement st = conn.prepareStatement(sql1);
            int rs = st.executeUpdate();
            String sql2 = "delete from classsinfo where pid ="+ss;
            PreparedStatement st1 = conn.prepareStatement(sql1);
            int rs1 = st1.executeUpdate();
            String sql3 = "delete from class_uid where pid ="+ss;
            PreparedStatement st2 = conn.prepareStatement(sql1);
            int rs3 = st2.executeUpdate();
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
        return 0;
    }
}
