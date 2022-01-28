<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,DAO.*,BeanClass.*" %>
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
<title>Order Grooved</title>
<%
	String firstname = (String) session.getAttribute("firstname");
	String lastname =  (String) session.getAttribute("lastname");
	String position = (String) session.getAttribute("position");
	int userid = (Integer) session.getAttribute("userid");
	Dao d = new Dao();	
	List<GroovedFittingBean> list = d.getAllDetailsOfGroovedFittings();
	
	
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
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Size</th>
                <th scope="col">Product Available</th>
                <th scope="col">Unit price</th>
                <th scope="col">Product Required</th>
                <th scope="col">Client Name</th>
                <th scope="col">Client Address</th>
                <td scope="col">Client Email Id</td>
                <th scope="col">Order</th>
                
            </tr>
        </thead>
        <tbody>
           
           <%for(GroovedFittingBean gf : list){ %>
                <tr id="<%= gf.getId() %>">
                    <th scope="row"><%= gf.getId() %></th>
                    <td><%= gf.getProductName() %></td>
                    <td><%= gf.getProductSize() %></td>
                    <td><%= gf.getNoOfProduct()  %></td>
                    <td><%= gf.getUnitPrice() %></td>
                    <td><input type="number" id="<%= "Qty_"+gf.getId() %>" name="productrequired" placeholder="Product Required" ></td>
                    <td><input type="text" id="<%= "client_"+gf.getId() %>" name="clientname" placeholder="Client Name"></td>
                    <td><textarea id="<%= "add_"+gf.getId() %>"></textarea></td>
                    <td><input type="email" placeholder="example@gmail.com" id="<%= "email_"+gf.getId() %>"></td>
                   	<td><button class="btn btn-outline-secondary" onclick="placeOrder(<%= gf.getId() %>,<%= "Qty_"+gf.getId() %>,`<%= gf.getProductName() %>`,`<%= gf.getProductSize() %>`,`<%=userid %>`,`<%=firstname%>`,`<%=lastname %>`,<%="client_"+gf.getId() %>,<%="add_"+gf.getId()%>,`<%= gf.getNoOfProduct()%>`,<%= "email_"+gf.getId()%>,`<%= gf.getUnitPrice() %>`)" >place Order</button></td>
                	
                </tr>
            <%} %>
        </tbody>
    </table>
</div>

<!-- Footer -->
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="main.js"></script>
<script type="text/javascript">
function placeOrder(productId,productQuantityId,productName,productSize,userid,userfirstname,userlastname,clientNameId,clientAddressId,productAvailable,clientEmailId,unitprice){
	const productQuantity = productQuantityId.value;
	const clientname = clientNameId.value;
	const clientaddress = clientAddressId.value;
	const clientemail = clientEmailId.value;
	
	if(productQuantity == ""){
		alert("product quantity cannot be empty");
	}
		else if(clientname==""){
		alert("client name cannot be empty");
	}
	
	else if(clientaddress==""){
		alert("client address cannot be empty");
	}
	
	else if(clientemail==""){
		alert("Client email id cannot be empty");
	}
	
	else
	{
	const d = new Date();
	const month = d.getMonth()+1;
	const orderplaceddate = d.getFullYear()+"-"+month+"-"+d.getDate();
	const t = new Date();
	const orderplacedtime = t.getHours()+":"+t.getMinutes()+":"+t.getSeconds();
	
	const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  var res = this.responseText;
			  alert(res);
			  location.reload();
			}
		 
		  const url = "GroovedOrderPlaced?productid="+productId+"&userid="+userid+"&userfirstname="+userfirstname+"&userlastname="+userlastname+"&productname="+productName+"&productsize="+productSize+"&productquantity="+productQuantity+"&productavailable="+productAvailable+"&clientname="+clientname+"&clientaddress="+clientaddress+"&orderplaceddate="+orderplaceddate+"&orderplacedtime="+orderplacedtime+"&clientemail="+clientemail+"&unitprice="+unitprice;
		  xhttp.open("GET", url);
		  xhttp.send();
	}
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
</body>
</html>