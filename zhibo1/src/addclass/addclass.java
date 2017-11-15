package addclass;

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
public class addclass extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String ProductId  = req.getParameter("pid");
        String uids;
        Integer uid;
        if(req.getSession().getAttribute("existUser")==null){
            resp.sendRedirect("/index.jsp");
    }
        else{
            String userid = req.getSession().getAttribute("existUserid").toString();
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException classnotfoundexception) {
                //如果有异常就抛出
                classnotfoundexception.printStackTrace();
            }
            try {

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?user=root&password=1234&useUnicode=true&characterEncoding=UTF-8");
                Statement statement = conn.createStatement();
                String sql1 = "select uid from class_uid where pid ="+ProductId;
                PreparedStatement st = conn.prepareStatement(sql1);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                     uids = rs.getString("uid");
                     uid = Integer.parseInt(uids);
                    String sql = "insert into classinfo(pid,uuid,uid) values('"+ProductId+"','"+userid+"','"+uid+"')";
                    statement.executeUpdate(sql);
                    statement.close();
                    conn.close();
                    resp.sendRedirect("/order_userfindByUid.action?uid="+userid);
                }
            } catch (SQLException sqlexception) {
                sqlexception.printStackTrace();
            }
        }
    }

}
