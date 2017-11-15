package editproduct;
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
public class editproduct extends HttpServlet{

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        System.out.println("普通表单项演示：");
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
            FileItem fi1 = fileItemList.get(0);//课程名称
            FileItem fi2 = fileItemList.get(1);//图片文件
            FileItem fi3 = fileItemList.get(2);//作业文件
            FileItem fi4 = fileItemList.get(3);//二级分类
            System.out.println("二级分类："+fi4.getString("UTF-8"));
            FileItem fi5 = fileItemList.get(4);//课程描述
            FileItem fi6 = fileItemList.get(5);//课程id
            System.out.println("文件表单项演示：");
            System.out.println("Content-Type: " + fi2.getContentType());
            System.out.println("size: " + fi2.getSize());
            System.out.println("filename: " + fi2.getName());
            //获取上传基路径
            String path = getServletContext().getRealPath("/upload");
            // 保存文件
            File destFile = new File(path ,fi2.getName());
            fi2.write(destFile);
            File photoFile = new File(path ,fi3.getName());
            fi3.write(photoFile);
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException classnotfoundexception) {
                //如果有异常就抛出
                classnotfoundexception.printStackTrace();
            }
            try {
                //需要修改的数据
                String pname = fi1.getString();
                String img = fi2.getName().toString();
                String home = fi3.getName().toString();
                int csid = Integer.parseInt(fi4.getString("UTF-8"));
                String pdesc = fi5.getString();
                int pid = Integer.parseInt(fi6.getString("UTF-8"));
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?user=root&password=1234&useUnicode=true&characterEncoding=UTF-8");
                Statement statement = conn.createStatement();
//                String sql = "insert into product(pname,image,pdesc,csid) values('"+ProductId+"','"+image+"','"+pdesc+"','"+categorySecond+"')";
                System.out.println(pname);
                System.out.println(img);
                System.out.println(home);
                System.out.println(csid);
                System.out.println(pdesc);
                System.out.println(pid);
//                String sql = "update product set pname='"+pname+"',image='"+img+"',csid='"+csid+"',pdesc='"+pdesc+"'where pid ='"+pid;
                String sql ="update product set pname = '"+pname+"',image='"+img+"',csid='"+csid+"',pdesc='"+pdesc+"'where pid ="+pid;
                statement.executeUpdate(sql);
                String sql1 = "update class_uid set home='"+home+"'where pid ="+pid;
                statement.executeUpdate(sql1);
                resp.sendRedirect("/adminProduct_findAlllist.action?page=1");
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
