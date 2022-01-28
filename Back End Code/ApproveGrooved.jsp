<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,BeanClass.*,DAO.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<title>Approved Grooved</title>
	<%
        String firstname = (String) session.getAttribute("firstname");
        String lastname =  (String) session.getAttribute("lastname");
        String position = (String) session.getAttribute("position");
        Dao d = new Dao();
        List<OrderGroovedFittingBean> list = d.getAllApprovalDetailsOfGroovedFitting();
    %>
</head>
<body class="copybody">
<!-- Navbar -->
<nav class="__nav navbar navbar-expand-md navbar-dark sticky-top">
    <div class="container px-5">
        <a class="navbar-brand fw-bolder nav-link" href="index.jsp">Fitwel Industries</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link fw-bolder" href="dashboard.jsp">Home</a></li>
                <li class="nav-item dropdown" id="dropdown">
                    <a class="nav-link dropdown-toggle fw-bolder" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Product</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ThrededFitting.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="GroovedFittings.jsp">Grooved Fittings</a></li>
                        <li ><a class="dropdown-item" id="addproduct" href="AddProduct.jsp">Add Product</a></li>
                    </ul>
                </li>
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle fw-bolder" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Order</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="OrderThreded.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="OrderGrooved.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
               
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle fw-bolder" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Approval</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ApproveThreded.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="ApproveGrooved.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle fw-bolder" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">My Order</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="MyThrededOrder.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="MyGroovedOrder.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle fw-bolder" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Invoice</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="EditableInvoice.jsp">Editable Invoice</a></li>
                        <li><a class="dropdown-item" href="InvoiceGenerate.jsp">Simple Invoice</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle fw-bolder" id="navbarDropdownPortfolio" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><%= firstname %> <%= lastname %></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <li><a class="dropdown-item" href="YourProfile.jsp">Your Account</a></li>
                        <li><a class="dropdown-item"  href="ResetPassword.jsp">Reset Password</a></li>
                       	<li><a id="employeedetail" class="dropdown-item" href="EmployeeDetails.jsp">Employee Details</a></li>
                       	<li><button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal">Logout</button></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!--  logout model -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <form action="Logout.jsp" method="post">
                    <input type="submit" value="Yes"> 
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Approval Table-->
<div class="pt-5">
<div class="order search pt-2">
        <input type="search" id="example1" class="light-table-filter haver" data-table="order-table"
            placeholder="Filter">
    </div>
    <div class="container-fluid">
        <h1 class="pro fw-bolder">Grooved Fittings</h1>
    </div>
</div>
<div class="scroll container-fluid">
    <table style="width: 100% !important;" class="order-table table table-striped">
        <thead>
            <tr>
               <th scope="col">Order Id</th>
               	<th scope="col">Product Id</th>
                <th scope="col">User Id </th>
                <th scope="col">Employee Name</th>
                <th scope="col">Product Size</th>
                <th scope="col">Product Available</th>
                <th scope="col">Product Required</th>
                <th scope="col">Total Price</th>
                <th scope="col">Client Name</th>
                <th scope="col">Client Address</th>
                <th scope="col">Client Email</th>
                <th scope="col">Order Placed Date</th>
                <th scope="col">Order Placed Time</th>
                <th scope="col">Approved Date</th>
                <th scope="col">Approved Time</th>
                <th scope="col">Order Status</th>
                <th scope="col">Invoice Status</th>
                <th scope="col">Reject Order</th>
                <th scope="col">Approve Order</th>
            </tr>
        </thead>
        <tbody>
         	<%for (OrderGroovedFittingBean og : list){ %>
            	<tr>
                <td><%= og.getOrderId()%></td>
                <td><%= og.getProductId()%></td>
                <td><%= og.getUserId()%></td>
                <td><%= og.getUserFirstName()+" "+og.getUserLastName()%></td>
                <td><%= og.getProductsize()%></td>
                <td><%= og.getTotalProduct()%></td>
                <td><%= og.getProductrequired()%></td>
                <td><%= og.getTotalProductPrice()%></td>
                <td><%= og.getclientName()%></td>
                <td><%= og.getClientAddress()%></td>
                <td><%= og.getClientEmail()%></td>
                <td><%= og.getOrderPlacedDate()%></td>
                <td><%= og.getOrderPlacedTime()%></td>
                <td><%= og.getApprovalDate()%></td>
                <td><%= og.getApprovalTime()%></td>
                <td><%=og.getOrderStatus()%></td>
                <td><%= og.getInvoiceStatus() %></td>
                <%
                	String orderstat = og.getOrderStatus();
                	if(orderstat.equals("Approved")){
                 %>
                <td><button class="btn btn-outline-danger" id="<%= "del_"+og.getOrderId() %>"  disabled>Reject</button></td>
                <% } 
                	else{
                %>
                <td><button class="btn btn-outline-secondary" id="<%= "del_"+og.getOrderId() %>" onclick="deleteMyOrder(`<%= og.getOrderId() %>`,`<%= og.getProductrequired()%>`,`<%= og.getTotalProduct()%>`,`<%= og.getProductId()%>`)">Reject</button></td>
                <%}%>
                <td><button class="btn btn-outline-secondary" id="<%= "btn_"+og.getOrderId()%>" onclick="approvalProduct( `<%=og.getOrderId()%>`,`<%=position%>`)">Approved</button></td>	
                
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
<hr class="dropdown-divider">
<footer class="pt-4 mb-3 mt-5">

    <div class="container px-4 mt-auto">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="big m-0">Fitwel Industries
                    SF 535/7, Kollupalayam, </div>
                <div class="big m-0">
                    Near Kaniyur Toll Gate,
                    Coimbatore-641659, Tamil Nadu, India</div>
            </div>

            <div class="col-auto">
                <div class="big m-0">Gmail : fitwelindustries@gmail.com</div>
                <div class="big m-0">Phone : +91 90000 00000</div>
            </div>

            <div class="col-auto">
                <div class="big m-0">“Copyright © Fitwel Industries."</div>
            </div>
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="main.js"></script>
<script type="text/javascript">
	function deleteMyOrder(orderid,productreq,totalproduct,productid){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			  var res = this.responseText;
			  alert(res);
			 
			  location.reload();
			}
		const url = "DeleteMyGroovedOrder";
		xhttp.open("POST", url, true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("orderid="+orderid+"&productreq="+productreq+"&totalproduct="+totalproduct+"&productid="+productid);
	}
</script>


<%
if(position.equals("Employee"))
{
%>
<script>
document.getElementById("addproduct").style.display = "none";
document.getElementById("employeedetail").style.display = "none";
</script>

<% 
}
%>
<script>
function approvalProduct(orderid, position){
	if(position == "Employee"){
		
		alert("You are not Allowed to approve order!!");
	}
	
	else{
		const orderstatus = "Approved";
		const d = new Date();
		const month = d.getMonth()+1;
		const approvedate = d.getFullYear()+"-"+month+"-"+d.getDate();
		const approvetime = d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  var res = this.responseText;
			  alert(res);
			  location.reload();
			}
		  const url = "ApproveGroovedOrder?orderid="+orderid+"&orderstatus="+orderstatus+"&approvedate="+approvedate+"&approvetime="+approvetime;
		  xhttp.open("GET",url);
		  xhttp.send();
	}
}
</script>
</body>
</html>