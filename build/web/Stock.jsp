<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.sql.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Stock</title>
        <style>
             body{
            background-image:url(product1.jpg);
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
            background-color: white;
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

            .check,.clear{
                background-color: black; /* Green */
                border-radius:8px;
                color: red;
                padding: 8px 15px;
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.html" style="color:red">Mobile Shope Management</a>
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
        <h1>Stock</h1>
        <hr/>
        <%
            String product_name="",company_name="";
            int product_id=0,sum=0;
        try{
            product_name=request.getParameter("pname");
            company_name=request.getParameter("cname");
           // product_id=Integer.parseInt(request.getParameter("pid"));
            
            String databaseURL="jdbc:ucanaccess://c://Users//Education//Documents//MobileShopDB.accdb";
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection con=DriverManager.getConnection(databaseURL);
            
            String sql="select * from product where pname=? and cname=?";
            
            PreparedStatement ps=con.prepareStatement(sql);
           // ps.setInt(1,product_id);
            ps.setString(1,product_name);
            ps.setString(2,company_name);
            ResultSet rs =  ps.executeQuery();
           
           
            while(rs.next())
             {
                 sum=sum+rs.getInt(3);
             }
            

        }
        catch(Exception e){
          
        out.print("<script>swal('Oops...!', 'Something went wrong!', 'error')</script>;");
        
        }
  
       out.print("<table cellpadding=10>");
             out.print("<tr>");
                out.print("<td>Product Name</td>");
                out.print("<td><input type='text' name='Pname' value='"+product_name+"'></td>");
            out.print("</tr>");
           out.print(" <tr>");
                out.print("<td>Company Name</td>");
                out.print("<td><input type='text' name='Cname' value='"+company_name+"'></td>");
            out.print("</tr>");
            out.print("<tr>");
                out.print("<td>Quantity Left</td>");
               out.print(" <td><input type='text' name='qleft' value='"+sum+"'></td>");
            out.print("</tr>");
            out.print("<tr>");
                out.print("<td align='right' colspan=2><a href='Stock.html'><input type='button' name='check' value='Back' class='check'></a></td>");
                
            out.print("</tr>");
        out.print("</table>");
      %>                  
    </center>
    </body>
</html>
