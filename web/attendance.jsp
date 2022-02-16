<%-- 
    Document   : MobileRepairing.jsp
    Created on : 19 Apr, 2021, 12:22:04 PM
    Author     : admin
--%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance</title>
    </head>
    <body>
        <%
        
        
        
        try{
            String fname,lname,present,dates;
            fname=request.getParameter("a1");
            lname=request.getParameter("a2");
            present=request.getParameter("a3");
            dates=request.getParameter("a4");
            
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="INSERT INTO attendance(fname,lname,status,dates) VALUES(?,?,?,?)";
            
            PreparedStatement preparedstatement=con.prepareStatement(sql);
            preparedstatement.setString(1,fname);
            preparedstatement.setString(2,lname);
            preparedstatement.setString(3,present);
            preparedstatement.setString(4,dates);
            
            preparedstatement.executeUpdate();
            
           response.sendRedirect("Attendance.html");

        }
        catch(Exception e){
        
        out.print(e);
        }
        
        
        
        
        %>
    </body>
</html>
