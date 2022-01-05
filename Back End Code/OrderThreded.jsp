<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,DAO.*,BeanClass.*" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <title>Order Threded</title>
    <%
	String firstname = (String) session.getAttribute("firstname");
	String lastname =  (String) session.getAttribute("lastname");
	String position = (String) session.getAttribute("position");
	int userid = (Integer) session.getAttribute("userid");
	Dao d = new Dao();	
	List<ThrededFittingBean> list = d.getAllDetailsOfThrededFittings();
	
	
%>
</head>

<!-- Navbar -->
<nav class="__nav navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="container px-5">
        <a class="navbar-brand" href="index.jsp">Fitwel Industries</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Product</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ThrededFitting.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="GroovedFittings.jsp">Grooved Fittings</a></li>
                        <li><a class="dropdown-item" id="addproduct" href="AddProduct.jsp">Add Product</a>
                    </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Order</a>
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
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Approval</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ApproveThreded.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="ApproveGrooved.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
                    <li class="nav-item"><a class="nav-link" href="#">Pending</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><%= firstname %> <%= lastname %></a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                            <li><a class="dropdown-item" href="#">Your Profile</a></li>
                            <li><a class="dropdown-item" href="#">Reset Password</a>
                            </li>
                            <li><a class="dropdown-item" id="employeedetail" href="#">Employee Details</a></li>
                            <li><a class="dropdown-item" href="#">Log Out</a>
                        </ul>
                        </li>
            </ul>
        </div>
    </div>
</nav>
<div class="order search">
    <span class="fa fa-search form-control-feedback just"></span>
    <input type="search" id="example1" class="light-table-filter haver" data-table="order-table" placeholder="Filter">
</div>
<div class="container-fluid text-center mt-5">
    <h3>Threded Fittings</h3>
</div>
<div class="scroll container-fluid">
   <table style="width: 100% !important;" class="order-table table table-dark table-striped">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Size</th>
                <th scope="col">Product Available</th>
                <th scope="col">Product Required</th>
                <th scope="col">Client Name</th>
                <th scope="col">Client Address</th>
                <th scope="col">Order</th>
                
            </tr>
        </thead>
        <tbody>
           
           <%for(ThrededFittingBean tf : list)
           { 
        	   String productsize = tf.getProductSize();
           		if(tf.getProductSize().contains("\""))
           			productsize =  tf.getProductSize().replaceAll("\"","");
           		
           %>
                <tr id="<%= tf.getId() %>">
                    <th scope="row"><%= tf.getId() %></th>
                    <td><%= tf.getProductName() %></td>
                    <td><%= tf.getProductSize() %></td>
                    <td><%= tf.getNoOfProduct()  %></td>
                    <td><input type="number" id="<%= "Qty_"+tf.getId() %>" name="productrequired" placeholder="Product Required" ></td>
                    <td><input type="text" id="<%= "client_"+tf.getId() %>" name="clientname" placeholder="Client Name"></td>
                    <td><textarea id="<%= "add_"+tf.getId() %>"></textarea></td>
                   	<td><button class="btn btn-secondary" onclick="placeOrder(<%= tf.getId() %>,<%= "Qty_"+tf.getId() %>,`<%= tf.getProductName() %>`,`<%= productsize %>`,`<%=userid %>`,`<%=firstname%>`,`<%=lastname %>`,<%="client_"+tf.getId() %>,<%="add_"+tf.getId()%>,`<%= tf.getNoOfProduct()%>`)" >place Order</button></td>
                	
                </tr>
            <%} %>
        </tbody>
    </table>
</div>




<!-- Footer -->
<footer class="bg-dark py-4 mt-5">
    <div class="container px-4 mt-auto">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="big m-0 text-white ">Address :</div>
                <div class="big m-0 text-white">Fitwel Industries SF 535/7, Kollupalayam, </div>
                <div class="big m-0 text-white">
                    Near Kaniyur Toll Gate, Coimbatore-641659, Tamil Nadu, India</div>
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
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
(function(document) {
        'use strict';

        var LightTableFilter = (function(Arr) {

            var _input;

            function _onInputEvent(e) {
                _input = e.target;
                var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                Arr.forEach.call(tables, function(table) {
                    Arr.forEach.call(table.tBodies, function(tbody) {
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
                init: function() {
                    var inputs = document.getElementsByClassName('light-table-filter');
                    Arr.forEach.call(inputs, function(input) {
                        input.oninput = _onInputEvent;
                    });
                }
            };
        })(Array.prototype);

        document.addEventListener('readystatechange', function() {
            if (document.readyState === 'complete') {
                LightTableFilter.init();
            }
        });

    })(document);
</script>
<script type="text/javascript">
function placeOrder(productId,productQuantityId,productName,productSize,userid,userfirstname,userlastname,clientNameId,clientAddressId,productAvailable){
	const productQuantity = productQuantityId.value;
	const clientname = clientNameId.value;
	const clientaddress = clientAddressId.value;
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
		  const url = "ThrededOrderPlaced?productid="+productId+"&userid="+userid+"&userfirstname="+userfirstname+"&userlastname="+userlastname+"&productname="+productName+"&productsize="+productSize+"&productquantity="+productQuantity+"&productavailable="+productAvailable+"&clientname="+clientname+"&clientaddress="+clientaddress+"&orderplaceddate="+orderplaceddate+"&orderplacedtime="+orderplacedtime;
		  xhttp.open("GET", url);
		  xhttp.send();
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