<%-- 
    Document   : customer.jsp
    Created on : 19 Apr, 2021, 12:22:04 PM
    Author     : admin
--%>
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer</title>
    </head>
    <body>
        <%
        
        
        
        try{
            String fname,lname,pname,warranty,dates,mobile,cname;
            int price,qty;
            //id=Integer.parseInt(request.getParameter("a1"));
            fname=request.getParameter("a2");
            lname=request.getParameter("a3");
            mobile=request.getParameter("a4");
            pname=request.getParameter("a5");
            cname=request.getParameter("t1");
            qty=Integer.parseInt(request.getParameter("t2"));
            price=Integer.parseInt(request.getParameter("a6"));
            warranty=request.getParameter("a7");
            dates=request.getParameter("a8");
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="INSERT INTO customer(fname,lname,mobile,pname,cname,qty,price,warranty,dates) VALUES(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement preparedstatement=con.prepareStatement(sql);
            preparedstatement.setString(1,fname);
            preparedstatement.setString(2,lname);
            preparedstatement.setString(3,mobile);
            preparedstatement.setString(4,pname);
             preparedstatement.setString(5,cname);
            preparedstatement.setInt(6,qty);
             preparedstatement.setInt(7,price);
            preparedstatement.setString(8,warranty);
            preparedstatement.setString(9,dates);
            preparedstatement.executeUpdate();
            
           response.sendRedirect("Customer.html");

        }
        catch(Exception e){
        
        out.print(e);
        }
        
        
        
        
        %>
    </body>
</html>
