package saveproduct;

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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import java.io.File;
import java.util.List;
public class savproduct extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
		/*
		 * 上传三步
		 * 1. 得到工厂
		 * 2. 通过工厂创建解析器
		 * 3. 解析request，得到FileItem集合
		 * 4. 遍历FileItem集合，调用其API完成文件的保存
		 */
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(factory);
        try {
            List<FileItem> fileItemList = sfu.parseRequest(req);
            FileItem fi1 = fileItemList.get(0);
            FileItem fi2 = fileItemList.get(1);//photo
            FileItem fi3 = fileItemList.get(2);//homework
            FileItem fi4 = fileItemList.get(3);
            FileItem fi5 = fileItemList.get(4);
            FileItem fi6 = fileItemList.get(5);
            //获取上传基路径
            String path1 = getServletContext().getRealPath("/products/1");//图片
            String path2 = getServletContext().getRealPath("/upload");
            // 保存文件
            File destFile = new File(path1 ,fi2.getName());
            fi2.write(destFile);
            File photoFile = new File(path2 ,fi3.getName());
            fi3.write(photoFile);
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException classnotfoundexception) {
                //如果有异常就抛出
                classnotfoundexception.printStackTrace();
            }
            try {
                String ProductId  = fi1.getString("UTF-8");
                String  image = fi2.getName();
                String  pdesc = fi5.getString("UTF-8");
                int  categorySecond = Integer.parseInt(fi4.getString("UTF-8"));
                String  homework = fi3.getName();
                String userid  = req.getParameter("pid");
                String uids;
                Integer uid;
                int userids =Integer.parseInt(fi6.getString("UTF-8"));
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?user=root&password=1234&useUnicode=true&characterEncoding=UTF-8");
                Statement statement = conn.createStatement();
                String sql = "insert into product(pname,image,pdesc,csid) values('"+ProductId+"','"+image+"','"+pdesc+"','"+categorySecond+"')";
                statement.executeUpdate(sql);

//                String sql1="select pid from product where pname ="+ProductId;
                String sql1="select * from product";
                PreparedStatement ts = conn.prepareStatement(sql1);
                ResultSet rs = ts.executeQuery();
//                String sql1 = "select uid from class_uid where pid ="+ProductId;
//                PreparedStatement st = conn.prepareStatement(sql1);
//                ResultSet rs = st.executeQuery();
                while(rs.next()) {
                    if(rs.getString("pname").equals(ProductId)) {
                        uids = rs.getString("pid");
                        uid = Integer.parseInt(uids);
                        System.out.println("这是sessiond " + uid);
                        System.out.println("zheshi homword " + homework);
                        String sql2 = "insert into class_uid(pid,uid,home) values('" + uid + "','" + userids + "','" + homework + "')";
                        statement.executeUpdate(sql2);
                        statement.close();
                        conn.close();
                        resp.sendRedirect("/adminProduct_findAlllist.action?page=1");//给一个房间号
                    }
                }

            } catch (SQLException sqlexception) {
                sqlexception.printStackTrace();
            }
        } catch (FileUploadException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
