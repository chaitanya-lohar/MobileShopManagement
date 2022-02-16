<%-- 
    Document   : signup
    Created on : 17 Apr, 2021, 9:30:08 AM
    Author     : admin
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <%    
        
            
            try{
                String a,b;
                a=request.getParameter("email");
                b=request.getParameter("pass");
                 
            String databaseURL = "jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con = DriverManager.getConnection(databaseURL);
                      
            String sql = "INSERT INTO signup(email_id,password)VALUES(?,?)";
             
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
             preparedStatement.setString(1, a);
            preparedStatement.setString(2, b);
             response.sendRedirect("AdminSignUp.html");
            preparedStatement.executeUpdate();
             
              
             
            }

            catch(Exception e)
            {
             out.print(e);   
            }
        
        
        
        %>
    </body>
</html>
