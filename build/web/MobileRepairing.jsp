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
        <title>Mobile Repairing</title>
    </head>
    <body>
        <%
        
        
        
        try{
            String fname,lname,company,model,issue,dates;
            int charges;
            fname=request.getParameter("Fname");
            lname=request.getParameter("Lname");
            company=request.getParameter("Company");
            model=request.getParameter("Model");
            charges=Integer.parseInt(request.getParameter("Charges"));
            issue=request.getParameter("Issue");
            dates=request.getParameter("Dates");
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="INSERT INTO MobileRepairing(fname,lname,company,model,issue,dates,charges) VALUES(?,?,?,?,?,?,?)";
            
            PreparedStatement preparedstatement=con.prepareStatement(sql);
            preparedstatement.setString(1,fname);
            preparedstatement.setString(2,lname);
            preparedstatement.setString(3,company);
            preparedstatement.setString(4,model);
            preparedstatement.setString(5,issue);
            preparedstatement.setString(6,dates);
            preparedstatement.setInt(7,charges);
            preparedstatement.executeUpdate();
            
           response.sendRedirect("MobileRepairing.html");

        }
        catch(Exception e){
        
        out.print(e);
        }
        
        
        
        
        %>
    </body>
</html>
