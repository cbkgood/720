package userinfofind;

import classinfo.classinfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import classinfo.classinfo;

public class userinfofind{
    public ArrayList<classinfo> hashcode(Integer userid){
        ArrayList<classinfo> classes = new ArrayList<classinfo>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            //如果有异常就抛出
            classnotfoundexception.printStackTrace();
        }
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?user=root&password=1234&useUnicode=true&characterEncoding=UTF-8");
            Statement statement = conn.createStatement();
            PreparedStatement st = conn.prepareStatement("select username,pname,is_hot,grade from product,classinfo,user where classinfo.uuid='" + userid + "' and classinfo.pid=product.pid and classinfo.uid=user.uid");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                classinfo e = new classinfo();
                e.setProductname(rs.getString("pname"));
                e.setTeachname(rs.getString("username"));
                e.setGrade(rs.getString("grade"));
                e.setIs_hot(rs.getString("is_hot"));
                classes.add(e);
            }
            statement.close();
            conn.close();
            return classes;

        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
       return null;
    }
}
