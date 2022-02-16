<%-- 
    Document   : Admin_login
    Created on : 8 Apr, 2021, 8:08:06 AM
    Author     : admin
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
    </head>
    <body>
        <h2><a href="AdminLogin.html">Back</a></h2>
        <%
    
             String mail,pass;
            mail=request.getParameter("email");
            pass=request.getParameter("pass");
            
            String databaseURL = "jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con = DriverManager.getConnection(databaseURL);
             
            String sql="select * from signup where email_id=? and password=?";
            
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,mail);
            ps.setString(2,pass);
            
            ResultSet rs=ps.executeQuery();
        
            if(rs.next()){
                    session.setAttribute("email_id",rs.getString(2));
                    response.sendRedirect("home.html");
            }
            else{
            
            out.println("<font color=red><h1 align='center'>Sorry something went wrong!</h1></font>");
            out.println("<font color=red><h1 align='center'>Please check your email-id and password!</h1></font>");
            }
        %>
    </body>
</html>
