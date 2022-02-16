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
        <title>Employee</title>
    </head>
    <body>
        <%
        
        
        
        try{
            String fname,mobile,lname,email,address,image,adhaar;
            int salary;
            //id=Integer.parseInt(request.getParameter("id"));
            image=request.getParameter("image");
            fname=request.getParameter("fname");
            lname=request.getParameter("lname");
            mobile=request.getParameter("mobile");
            email=request.getParameter("e-mail");
            adhaar=request.getParameter("adhaar");
            salary=Integer.parseInt(request.getParameter("salary"));
            address=request.getParameter("addr");
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="INSERT INTO employees(image,fname,lname,mobile,email,adhaar,salary,address) VALUES(?,?,?,?,?,?,?,?)";
            
            PreparedStatement preparedstatement=con.prepareStatement(sql);
            preparedstatement.setString(1,image);
            preparedstatement.setString(2,fname);
            preparedstatement.setString(3,lname);
            preparedstatement.setString(4,mobile);
            preparedstatement.setString(5,email);
            preparedstatement.setString(6,adhaar);
            preparedstatement.setInt(7,salary);
            preparedstatement.setString(8,address);
            preparedstatement.executeUpdate();
            
           response.sendRedirect("Employee.html");

        }
        catch(Exception e){
        
        out.print(e);
        }
        
        
        
        
        %>
    </body>
</html>
