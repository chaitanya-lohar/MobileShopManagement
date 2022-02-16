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
            p{
                font-weight:bold;
                font-family:times new roman;
                font-size:50px;
                background-color:gray;
            }
        </style>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Report</title>
    </head>
    <body>
        <hr>
        <table><tr><td><a href="Report.html"><input type="button" value="Back" class="b1"></a>
                    <td><input type="button" value="Print" class="b1" onclick="window.print()"></a>
            </tr></table>
         <br>
        <p align="center">Attendance</p>
        <hr>
       <table class="table table-dark table-hover">  
            <tr>
                <th>First Name</th>
                  <th>Last Name</th>
                  <th>Present/Absent</th>
                  <th>date</th>
            </tr>
           
         <%
        try{
            
            String firstname,lastname,Dates;
            firstname=request.getParameter("t1");
            lastname=request.getParameter("t2");
            Dates=request.getParameter("t3");
        
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="select * from attendance where fname=? and lname=? and dates=?";
            
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,firstname);
            ps.setString(2,lastname);
            ps.setString(3,Dates);
           
            ResultSet rs=ps.executeQuery();
            
            
            
            if(rs.next()){
             %>
             <tr>
            <td><%=rs.getString(4)%></td>    
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
           
             </tr>
            <%
            }
            else{
                out.println("<script>alert('No Record found!')</script>");
            }
        }
        catch(Exception e){
        
         out.println(e);
        }
     
        %>
         
        </table>
    </body>
</html>
