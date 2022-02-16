<%-- 
    Document   : delete
    Created on : 30-Apr-2021, 6:16:38 pm
    Author     : admin
--%>

<%@page import="java.sql.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
         <%
       try{
            
            int emp_id;
            emp_id=Integer.parseInt(request.getParameter("empid"));
            out.println(emp_id);
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
           String sql="delete from employees where ID=?";
            
            PreparedStatement preparedstatement=con.prepareStatement(sql);
            
            preparedstatement.setInt(1,emp_id);
            preparedstatement.executeUpdate();
            
           response.sendRedirect("employee_report.jsp");
           
        } 
        catch(Exception e){
        
         out.println("something is wrong! error: "+e);
        }
     
        %>
    </body>
</html>
