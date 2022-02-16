

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
                            <% 
                            
                            String FirstN,LastN,CompanyN,Model,Issue;
                            int Charges,amountpaid;
                                FirstN=request.getParameter("b1");
                                LastN=request.getParameter("b2");
                                CompanyN=request.getParameter("b3");
                                Model=request.getParameter("b4");
                               Issue=request.getParameter("b6");
                               Charges=Integer.parseInt(request.getParameter("b5"));
                               amountpaid=Integer.parseInt(request.getParameter("b7"));
                               
                            %>
                            <%@page import="java.util.*,java.io.*"%>
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
					<td><span ><% out.print(request.getParameter("b5"));%></span></td>
				</tr>
			</table>
			<table class="inventory">
				<thead>
					<tr>
						<th><span >Customer Name</span></th>
						<th><span >Company Name</span></th>
						<th><span >Model No.</span></th>
						<th><span >Issue</span></th>
						<th><span >Charges</span></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span ><% out.print(FirstN+" "+LastN);%></span></td>
						<td><span ><% out.print(CompanyN);%></span></td>
						<td><span ><%out.print(Model);%></span></td>
						<td><span ><% out.print(Issue);%></span></td>
						<td><div><%out.print(Charges); %></div></td>
					</tr>
				</tbody>
			</table>
			
			<table class="balance">
				<tr>
					<th><span >Total</span></th>
					<td><div><%out.print(Charges); %></div></td>
				</tr>
				<tr>
					<th><span >Amount Paid</span></th>
					<td><span ><% out.print(amountpaid);%></span></td>
				</tr>
				<tr>
					<th><span >Balance Due</span></th>
                                        <td><div><%out.print(Charges-amountpaid); %></div></td>
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