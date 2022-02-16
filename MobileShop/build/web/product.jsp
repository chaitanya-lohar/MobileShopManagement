<%-- 
    Document   : product.jsp
    Created on : 17 Apr, 2021, 10:05:44 PM
    Author     : admin
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
        <%
        
         try{
                String pname,date,cname,warranty;
                int qty;
                //pid=Integer.parseInt(request.getParameter("t1"));
                pname=request.getParameter("t2");
                qty=Integer.parseInt(request.getParameter("t3"));
                date=request.getParameter("t4");
                cname=request.getParameter("t5");
                warranty=request.getParameter("t6");
                 
            String databaseURL = "jdbc:ucanaccess://c://Users//Education//Documents//MobileShop.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con = DriverManager.getConnection(databaseURL);
                      
            String sql = "INSERT INTO product(pname,qty,dates,cname,warranty)VALUES(?,?,?,?,?)";
             
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            
            
            preparedStatement.setString(1, pname);
            preparedStatement.setInt(2, qty);
            preparedStatement.setString(3, date);
            preparedStatement.setString(4, cname);
            preparedStatement.setString(5, warranty);
            preparedStatement.executeUpdate();
              response.sendRedirect("Product.html");
              
            }

            catch(Exception e)
            {
             out.print(e);   
            }
        
        %>
        
    </body>
</html>
