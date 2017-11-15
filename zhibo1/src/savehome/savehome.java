//package savehome;
//import org.apache.struts2.ServletActionContext;
//import cn.itcast.shop.user.vo.User;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.Driver;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.sql.*;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import java.io.*;
//import javax.servlet.*;
//import javax.servlet.http.*;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//
//import java.io.File;
//import java.util.List;
//public class savehome extends HttpServlet {
//    public void doPost(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//        req.setCharacterEncoding("utf-8");
//        resp.setContentType("text/html;charset=utf-8");
//		/*
//		 * 上传三步
//		 * 1. 得到工厂
//		 * 2. 通过工厂创建解析器
//		 * 3. 解析request，得到FileItem集合
//		 * 4. 遍历FileItem集合，调用其API完成文件的保存
//		 */
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        ServletFileUpload sfu = new ServletFileUpload(factory);
//        try {
//            System.out.println("这里");
//            List<FileItem> fileItemList = sfu.parseRequest(req);
//            FileItem fi1 = fileItemList.get(0);//productname
//            System.out.println("这里"+fi1.getString());
//            FileItem fi2 = fileItemList.get(1);//homework
//            System.out.println("这里");
//            FileItem fi3 = fileItemList.get(2);//homework
//            //获取上传基路径
//            System.out.println("这里");
//            String path2 = getServletContext().getRealPath("/upload");
//            // 保存文件
//            File destFile = new File(path2, fi2.getName());
//            fi2.write(destFile);
//            System.out.println("这里");
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//            } catch (ClassNotFoundException classnotfoundexception) {
//                //如果有异常就抛出
//                classnotfoundexception.printStackTrace();
//            }
//            try {
//                System.out.println("这里");
//                String Productname = fi1.getString("UTF-8");
//                String fileaddress = fi2.getString("UTF-8");
//                int uuid = Integer.parseInt(fi3.getString("UTF-8"));
//                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?user=ylx&password=ylx&useUnicode=true&characterEncoding=UTF-8");
//                Statement statement = conn.createStatement();
//                String sql = "select pid from product where pname='" + Productname + "'";
//                PreparedStatement ts = conn.prepareStatement(sql);
//                ResultSet rs = ts.executeQuery();
////                String sql1 = "select uid from class_uid where pid ="+ProductId;
////                PreparedStatement st = conn.prepareStatement(sql1);
////                ResultSet rs = st.executeQuery();
//                while (rs.next()) {
//                    String uids;
//                    uids = rs.getString("pid");
//                    System.out.println("这里");
//                    String sql2 = "update classinfo set fileaddress='" + fileaddress + "' where pid='" + uids + "' and uuid='" + uuid + "'  ";
//                    statement.executeUpdate(sql2);
//                    statement.close();
//                    conn.close();
//                    resp.sendRedirect("/order_userfindByUid.action?uid="+uuid);
//                }
//              }catch (SQLException sqlexception) {
//                sqlexception.printStackTrace();
//              }
//            }
//        catch (FileUploadException e) {
//            throw new RuntimeException(e);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }
//}

package savehome;
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
import javax.persistence.criteria.CriteriaBuilder;
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
public class savehome extends HttpServlet {
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
            System.out.println("这里");
            List<FileItem> fileItemList = sfu.parseRequest(req);
            FileItem fi1 = fileItemList.get(0);//productname
            System.out.println("这里"+fi1.getString("UTF-8"));
            FileItem fi2 = fileItemList.get(1);//homework
            System.out.println("这里");
            FileItem fi3 = fileItemList.get(2);//homework
            //获取上传基路径
            System.out.println("这里");
            String path2 = getServletContext().getRealPath("/upload");
            // 保存文件
            File destFile = new File(path2, fi2.getName());
            fi2.write(destFile);
            System.out.println("这里");
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException classnotfoundexception) {
                //如果有异常就抛出
                classnotfoundexception.printStackTrace();
            }
            try {
                System.out.println("这里");
                String Productname = fi1.getString("UTF-8");
                String fileaddress = fi2.getName();
                System.out.println(fileaddress);
                int uuid = Integer.parseInt(fi3.getString("UTF-8"));
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?user=root&password=1234&useUnicode=true&characterEncoding=UTF-8");
                Statement statement = conn.createStatement();
                String sql = "select * from product ";
                PreparedStatement ts = conn.prepareStatement(sql);
                ResultSet rs = ts.executeQuery();
//                String sql1 = "select uid from class_uid where pid ="+ProductId;
//                PreparedStatement st = conn.prepareStatement(sql1);
//                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    if(rs.getString("pname").equals(Productname)){
                        Integer uids;
                        System.out.println("到这里");
                        uids = Integer.valueOf(rs.getString("pid"));
                        System.out.println("这里");
                        String sql2 = "update classinfo set fileaddress='" + fileaddress + "' where pid='" + uids + "' and uuid='" + uuid + "'  ";
                        statement.executeUpdate(sql2);

                        resp.sendRedirect("/order_userfindByUid.action?uid="+uuid);
                    }}
                statement.close();
                conn.close();
            }catch (SQLException sqlexception) {
                sqlexception.printStackTrace();
            }
        }
        catch (FileUploadException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}