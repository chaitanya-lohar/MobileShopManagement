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
        <%
        
//        String mail,pass;
//        mail=request.getParameter("email");
//        pass=request.getParameter("pass");
//        
//        if(mail.equals("admin@gmail.com") && pass.equals("admin")){
//            response.sendRedirect("home.html");
//            
//        }
//        else{
//            out.print("failed..");
//        }
//        
             String mail,pass;
            mail=request.getParameter("email");
            pass=request.getParameter("pass");
            
            String databaseURL = "jdbc:ucanaccess://c://Users//Education//Documents//MobileShop.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con = DriverManager.getConnection(databaseURL);
             
           
             String sql = "select * from signup";
             
            Statement cst = con.createStatement();
                
            ResultSet rs = cst.executeQuery(sql);
             
            while(rs.next()){
            
                if(mail.equals(rs.getString(2)) && pass.equals(rs.getString(3))){
                    
                    response.sendRedirect("home.html");
                                 
                }
                    
            
            }
            

        
        %>
    </body>
</html>
