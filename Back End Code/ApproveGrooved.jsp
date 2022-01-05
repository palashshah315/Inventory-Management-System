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
<body>
<nav class="__nav navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="container px-5">
        <a class="navbar-brand" href="index.jsp">Fitwel Industries</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a></li>
                <li class="nav-item dropdown" id="dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Product</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ThrededFitting.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="GroovedFittings.jsp">Grooved Fittings</a></li>
                        <li ><a class="dropdown-item" id="addproduct" href="AddProduct.jsp">Add Product</a></li>
                    </ul>
                </li>
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Order</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="OrderThreded.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="OrderGrooved.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
               <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Invoice</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="#">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="#">Grooved Fittings</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown" id="dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog"  role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Approval</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ApproveThreded.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="ApproveGrooved.jsp">Grooved Fittings</a></li>
                        
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Pending</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><%= firstname %> <%= lastname %></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <li><a class="dropdown-item" href="dashboard.jsp#youraccount">Your Account</a></li>
                        <li><a class="dropdown-item"  href="#">Reset Password</a></li>
                        <li><a id="employeedetail" class="dropdown-item" href="#">Employee Details</a></li>
                        <li><a class="dropdown-item" href="#">Log Out</a> 
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Approval Table-->
<div class="order search">
    <span class="fa fa-search form-control-feedback just"></span>
    <input type="search" id="example1" class="light-table-filter haver" data-table="order-table" placeholder="Filter">
</div>
<div class="container-fluid">
    <h2 class="pro mt-5"><b>Grooved Fittings</b></h2>
</div>
<div class="scroll container-fluid">
    <table style="width: 100% !important;" class="order-table table table-dark table-striped">
        <thead>
            <tr>
                <th scope="col">Order Id </th>
                <th scope="col">User Id</th>
                <th scope="col">Product Id</th>
                <th scope="col">Employee Name</th>
                <th scope="col">Product Name</th>
                <th scope="col">Product Size</th>
                <th scope="col">Product Available</th>
                <th scope="col">Product Required</th>
                <th scope="col">Client Name</th>
                <th scope="col">Client Address</th>
                <th scope="col">Order Placed Date</th>
                <th scope="col">Order Placed Time</th>
                <th scope="col">Order Status</th>
                <th scope="col">Approved Order</th>
            </tr>
        </thead>
        <tbody>
         	<%for (OrderGroovedFittingBean og : list){ %>
            	<tr id="<%= og.getOrderId() %>">
            	<td><%= og.getOrderId() %></td>
                <td><%= og.getUserId() %></td>
                <td><%= og.getProductId()  %></td>
                <td><%= og.getUserFirstName()+" "+og.getUserLastName() %></td>
                <td><%= og.getProductname() %></td>
                <td><%= og.getProductsize() %></td>
                <td><%= og.getTotalProduct() %></td>
                <td><%= og.getProductrequired() %></td>
                <td><%= og.getclientName() %></td>
                <td><%= og.getClientAddress() %></td>
                <td><%= og.getOrderPlacedDate() %></td>
                <td><%= og.getOrderPlacedTime() %></td>
                <td><%= og.getOrderStatus() %></td>
                <td><button class="btn btn-secondary" id="<%= "btn_"+og.getOrderId()%>" onclick="approvalProduct( `<%=og.getOrderId()%>`,`<%=position%>`)">Approved Order</button></td>	
                </tr>
            <% } %>
        </tbody>
    </table>
</div>
<footer class="bg-dark py-4 mt-5">

    <div class="container px-4 mt-auto">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="big m-0 text-white ">Address :</div>
                <div class="big m-0 text-white">Fitwel Industries
                    SF 535/7, Kollupalayam, </div>
                <div class="big m-0 text-white">
                    Near Kaniyur Toll Gate,
                    Coimbatore-641659, Tamil Nadu, India</div>
            </div>

            <div class="col-auto">
                <div class="big m-0 text-white">Gmail : fitwelindustries@gmail.com</div>
                <div class="big m-0 text-white">Phone : +91 90000 00000</div>
            </div>

            <div class="col-auto">
                <div class="big m-0 text-white">“Copyright © Fitwel Industries."</div>
            </div>
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (function (document) {
        'use strict';

        var LightTableFilter = (function (Arr) {

            var _input;

            function _onInputEvent(e) {
                _input = e.target;
                var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                Arr.forEach.call(tables, function (table) {
                    Arr.forEach.call(table.tBodies, function (tbody) {
                        Arr.forEach.call(tbody.rows, _filter);
                    });
                });
            }

            function _filter(row) {
                var text = row.textContent.toLowerCase(),
                    val = _input.value.toLowerCase();
                row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
            }

            return {
                init: function () {
                    var inputs = document.getElementsByClassName('light-table-filter');
                    Arr.forEach.call(inputs, function (input) {
                        input.oninput = _onInputEvent;
                    });
                }
            };
        })(Array.prototype);

        document.addEventListener('readystatechange', function () {
            if (document.readyState === 'complete') {
                LightTableFilter.init();
            }
        });

    })(document);
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