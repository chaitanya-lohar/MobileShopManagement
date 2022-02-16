<%-- 
    Document   : logout
    Created on : 30-Apr-2021, 9:17:51 pm
    Author     : admin
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
       <script src="backNoWork.js" type="text/javascript"></script>
    </head>
    <body bgcolor="cyan">
    
        <% 
           response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Expires", "0");
            response.setDateHeader("Expires", -1);
            session.invalidate();
            out.println("<center><h1>you have successfully logged out!</center></h1>");
        %>
    <center><h2><a href="AdminLogin.html">Login</a></h2></center>
    </body>
</html>
