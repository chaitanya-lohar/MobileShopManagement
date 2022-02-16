<%-- 
    Document   : product_report.jsp
    Created on : 26 Apr, 2021, 11:51:46 AM
    Author     : admin
--%>
<%@page import="java.sql.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            
           .b1{
                background-color:#212529; /* Green */
                border-radius:8px;
                color: white;
                padding: 5px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 15px;
                border-color:red;
            }
            input{
                border-radius:4px;
                font-weight:bold;
            }
        </style>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Report</title>
    </head>
    <body>
        <hr>
        <table><tr><td><a href="Report.html"><input type="button" value="Back" class="b1"></a>
                    <td><input type="button" value="Print" class="b1" onclick="window.print()"></a>
            </tr></table>
        <hr>
       <table class="table table-dark table-hover">  
            <tr>
                <th>Product ID</th>
                  <th>Product Name</th>
                  <th>Quantity</th>
                  <th>Dates</th>
                  <th>Company Name</th>
                  <th>Warranty Period</th>
            </tr>
           
         <%
        try{
            
            String firstdate,lastdate;
            firstdate=request.getParameter("d1");
            lastdate=request.getParameter("d2");
            
            
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShop.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="select * from product where dates BETWEEN ? and ?";
            
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,firstdate);
            ps.setString(2,lastdate);
            
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
            %>
             <tr>
            <td><%=rs.getString(1)%></td>     
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getInt(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
             </tr>
            <%
            }
            
        }
        catch(Exception e){
        
         out.println(e);
        }
        
        
        
        
        %>
         
        </table>
    </body>
</html>
