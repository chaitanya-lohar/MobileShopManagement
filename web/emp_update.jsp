<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.sql.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Employee</title>
        <style>
            
             body{
            background-image:url(attendance1.jpg);
            background-size:1366px 768px;
        }
             h1,td{
             color:red;
             background-color:black;
             font-weight:bold;
            }
            table{
                opacity:0.8;
            }
            
            .dropdown {
            position: relative;
            display: inline-block;
          }

          .dropdown-content {
            display: none;
            position: absolute;
            background-color:white;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
          }
          .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
          }

            .dropdown-content a:hover {background-color: gray;color:white;}

            .dropdown:hover .dropdown-content {display: block;}

            .add,.update,.delete{
                background-color: black; 
                border-radius:8px;
                color: red;
                padding: 5px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 15px;
                border-color:red;
            }
            input,textarea{
                border-radius:4px;
                font-weight:bold;
            }
        </style>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.html" style="color:red">Mobile Shop Management</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.html" >Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Product.html" >Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Customer.html">Customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Stock.html">Stock</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="MobileRepairing.html" >Mobile Repairing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Employee.html">Employee</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Attendance.html" >Attendance</a>
        </li>
        <li class="nav-item">
            <div class="dropdown">
          <a class="nav-link active dropbtn" href="">Bill</a>
              <div class="dropdown-content">
              <a href="bill_for_accessories.html">Bill For Accessories</a>
              <a href="bill_for_repairing.html">Bill For Repairing</a>
              
             </div>
           </div>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Report.html">Report</a>
        </li>
      </ul>
      <form class="d-flex">
        <!--<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">-->
        <button class="btn btn-outline-success" type="submit">Logout</button>
      </form>
    </div>
  </div>
</nav>
      <hr/>   
          
    <center>
        <%
        int empid,salary;
        String image,fname,lname,mobile,email,adhaar,address;
        
        empid=Integer.parseInt(request.getParameter("empid"));
        fname=request.getParameter("fname");
        lname=request.getParameter("lname");
        mobile=request.getParameter("mobile");
        email=request.getParameter("email");
        adhaar=request.getParameter("adhaar");
        salary=Integer.parseInt(request.getParameter("salary"));
        address=request.getParameter("address");
        %>
        
        <h1>Employee Details</h1>
        <hr/>
        <form method="post" action="update.jsp">
        <table cellpadding="10">
            <tr>
                <td>Employee ID</td>
                <td><input type="text" name="id" value="<%=empid%>" required></td>
                <td>Select Image:</td>
                <td><input type="file" name="image" accept="image/*" required></td>  
            </tr>
            <tr>
                <td>First Name</td>
                <td><input type="text" name="fname" value="<%=fname%>" required></td>
                <td>Last Name</td>
                <td><input type="text" name="lname" value="<%=lname%>" required></td>
                
            </tr>
            <tr>
                <td>Mobile No.</td>
                <td><input type="number" name="mobile" value="<%=mobile%>" required></td>
                <td>Email ID</td>
                <td><input type="email" name="e-mail" value="<%=email%>" required></td>
                
            </tr>
            <tr>
                <td>Adhaar No</td>
                <td><input type="number" name="adhaar" value="<%=adhaar%>" required></td>
                <td>Salary</td>
                <td><input type="number" name="salary" value="<%=salary%>" required></td>
            </tr>
            <tr>
                <td colspan="2">address</td>
                <td colspan="2"  align="center"><textarea name="addr" rows="4" cols="30" required><%=address%></textarea></td>
            </tr>
            <tr>
                <td align="center" colspan="2"><input type="Submit" name="add" value="Update" class="add"></td>
                <td align="center" colspan="2"><a href="employee_report.jsp"><input type="button" name="clear" value="Back" class="delete"></a></td>
            </tr>
        </table>
            </form>
    </center>
    </body>
</html>
