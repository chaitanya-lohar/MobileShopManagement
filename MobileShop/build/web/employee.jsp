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
            int id,salary;
            id=Integer.parseInt(request.getParameter("id"));
            image=request.getParameter("image");
            fname=request.getParameter("fname");
            lname=request.getParameter("lname");
            mobile=request.getParameter("mobile");
            email=request.getParameter("e-mail");
            adhaar=request.getParameter("adhaar");
            salary=Integer.parseInt(request.getParameter("salary"));
            address=request.getParameter("addr");
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShop.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="INSERT INTO employee(id,image,fname,lname,mobile,email,adhaar,salary,address) VALUES(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement preparedstatement=con.prepareStatement(sql);
            preparedstatement.setInt(1,id);
            preparedstatement.setString(2,image);
            preparedstatement.setString(3,fname);
            preparedstatement.setString(4,lname);
            preparedstatement.setString(5,mobile);
            preparedstatement.setString(6,email);
            preparedstatement.setString(7,adhaar);
            preparedstatement.setInt(8,salary);
            preparedstatement.setString(9,address);
            preparedstatement.executeUpdate();
            
           response.sendRedirect("Employee.html");

        }
        catch(Exception e){
        
        out.print(e);
        }
        
        
        
        
        %>
    </body>
</html>
