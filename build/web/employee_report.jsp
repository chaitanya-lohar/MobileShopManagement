<%-- 
    Document   : employee_report
    Created on : 29-Apr-2021, 12:17:15 am
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
            .b2{
                background-color:green;
                padding: 10px 20px;
                color:white;
                 display: inline-block;
            }
            p{
                font-weight:bold;
                font-family:times new roman;
                font-size:50px;
                background-color:gray;
            }
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Employee Report</title>
    </head>
    <body>
        <hr>
        <table><tr><td><a href="Report.html"><input type="button" value="Back" class="b1"></a>
                    <td><input type="button" value="Print" class="b1" onclick="window.print()"></a>
            </tr></table>
        <br>
        <p align="center">All Employee's Records</p>
        <hr>
        <table class="table table-hover ">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Employee ID</th>
      <th scope="col">Image</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Mobile No.</th>
      <th scope="col">Email ID</th>
      <th scope="col">Aadhaar No.</th>
      <th scope="col">Salary</th>
      <th scope="col">Address</th>
      <th scope="col">Update</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
      <%
        try{
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="select * from employees";
            
            PreparedStatement ps=con.prepareStatement(sql); 
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                
            %>
              <tr>
                 
                <th scope="row"><%=rs.getInt(1)%></th>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getInt(8)%></td>
                <td><%=rs.getString(9)%></td>
                <td><a href="emp_update.jsp?empid=<%=rs.getInt(1)%>&image=<%=rs.getString(2)%>&fname=<%=rs.getString(3)%>&lname=<%=rs.getString(4)%>&mobile=<%=rs.getString(5)%>&email=<%=rs.getString(6)%>&adhaar=<%=rs.getString(7)%>&salary=<%=rs.getInt(8)%>&address=<%=rs.getString(9)%>"><input type="button" value="Update" name="b1" class="b2"></a></td>
                <td><a href="delete.jsp?empid=<%=rs.getInt(1)%>"><input type="button" value="Delete" name="b2" class="b2"></a></td>
              </tr>
            <%
            }
            
        }
        catch(Exception e){
        
         out.println(e);
        }
     
        %>
  </tbody>
</table>
    </body>
</html>
