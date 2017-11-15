package showecharts;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class showecharts extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        String userid=request.getParameter("userid");
//	    String deviceName=request.getParameter("device_name");
//	    System.out.print("action:");
//	    System.out.print(action);
//	    System.out.print(deviceId);
//	    System.out.print(deviceName);
        System.out.println("这是userid"+userid);
        List jsonList=new ArrayList();
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (ClassNotFoundException clssNotFoundException){
            clssNotFoundException.printStackTrace();
        }
        try{
            String url="jdbc:mysql://localhost:3306/shop";
            Connection con=DriverManager.getConnection(url,"root","1234");
            Statement stmt=con.createStatement();
            String sql="select pname,uuid,grade from classinfo,product where classinfo.pid=product.pid";
            ResultSet rs=stmt.executeQuery(sql);
            System.out.print("连接完成");
            while(rs.next()){
                if(rs.getString("uuid").equals(userid)) {
                    Map map = new HashMap();
                    map.put("device_id", rs.getString("pname"));
                    map.put("device_name", rs.getString("grade"));
//                    System.out.println("这里有一条" + rs.getString("video_name"));
                    jsonList.add(map);
                }
            }
            stmt.close();
            con.close();
        }catch (SQLException sqlexception){
            sqlexception.printStackTrace();
        }

        //�ش�
        JSONObject json=new JSONObject();
        try {
            json.put("aaData",jsonList);
        } catch (JSONException e1) {

            e1.printStackTrace();
        }
        try {
            json.put("result_msg","ok");
        } catch (JSONException e1) {

            e1.printStackTrace();
        }
        try {
            json.put("result_code",0);
        } catch (JSONException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        try{
            response.getWriter().print(json);
            response.getWriter().flush();
            response.getWriter().close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}