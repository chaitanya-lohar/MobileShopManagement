

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Invoice</title>
		<link rel="stylesheet" href="style.css">
		<link rel="license" href="https://www.opensource.org/licenses/mit-license/">
		<script src="script.js"></script>
	</head>
	<body>
		<header>
			<h1>Invoice</h1>
			<address contenteditable>
				<p>131</p>
				<p>Sec. 3 BSNL Road<br>Shakti Nagar</p>
				<p>313001</p>
			</address>
			<span><img alt="" src="http://www.jonathantneal.com/examples/invoice/logo.png"><input type="file" accept="image/*"></span>
		</header>
		<article>
			<h1>Recipient</h1>
			<address contenteditable>
				<p>Mobile Shope Management<br>c/o chaitanya</p>
			</address>
			<table class="meta">
                            <%@page import="java.util.*,java.io.*,java.lang.*"%>
                            <% 
                                String FirstN,LastN,Pname,Warranty,MobileNo;
                                int Price,amountpaid;
                              
                                    FirstN=request.getParameter("a1");
                                    LastN=request.getParameter("a2");
                                   MobileNo=request.getParameter("a3");
                                    Pname=request.getParameter("a4");
                                   Price=Integer.parseInt(request.getParameter("a5"));
                                   amountpaid=Integer.parseInt(request.getParameter("a6"));
                                   Warranty=request.getParameter("a7");
                                   
                            %>
                            
				<tr>
					<th><span >Invoice #</span></th>
					<td><span >101138</span></td>
				</tr>
				<tr>
					<th><span >Date</span></th>
                                        <% Date date=new Date();%>
					<td><span  ><% out.print(date.toString());%></span></td>
                                        
				</tr>
				<tr>
					<th><span >Amount Due</span></th>
					<td><span ><% out.print(Price);%></span></td>
				</tr>
			</table>
			<table class="inventory">
				<thead>
					<tr>
						<th><span >Customer Name</span></th>
						<th><span >Mobile NO.</span></th>
						<th><span >Product Name</span></th>
						<th><span >Price</span></th>
                                                <th><span >Warranty</span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span ><% out.print(FirstN+" "+LastN);%></span></td>
						<td><span ><% out.print(MobileNo);%></span></td>
						<td><span ><%out.print(Pname);%></span></td>
						<td><span ><% out.print(Price);%></span></td>
						<td><div><%out.print(Warranty); %></div></td>
					</tr>
				</tbody>
			</table>
			
			<table class="balance">
				<tr>
					<th><span >Total</span></th>
					<td><div><%out.print(Price); %></div></td>
				</tr>
				<tr>
					<th><span >Amount Paid</span></th>
					<td><span ><% out.print(amountpaid);%></span></td>
				</tr>
				<tr>
					<th><span >Balance Due</span></th>
                                        <td><div><%out.print(Price-amountpaid); %></div></td>
				</tr>
			</table>
		</article>
                                
		<aside> <div>
                            <input type="button" value="Print" name="bt" onclick="window.print()">
                                </div>
			<h1><span >Additional Notes</span></h1>
                       
			<div contenteditable>
				<p>A finance charge of 1.5% will be made on unpaid balances after 30 days.</p>
			</div>
		</aside>
	</body>
</html>