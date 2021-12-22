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
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <title>OrderThreded</title>
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
                    <li class="nav-item"><a class="nav-link" href="#">Invoice</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Approval</a></li>
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

<!--<input type="search" class="light-table-filter" data-table="order-table" placeholder="Filter">
 search box -->
<!-- <div class="order col-md-3">
        <div class="form-group has-search">
            <span class="fa fa-search form-control-feedback"></span>
            <input type="text" id="myInput" onkeyup="myFunction()" class="form-control" placeholder="Search for names.."
                title="Type in a name">
        </div>
    </div>
<table id="myTable">
    <tr class="header">
        <th>Id</th>
        <th>Name</th>
        <th>Size</th>
        <th>No Of Product</th>
        <th>Order</th>
    </tr>
    <tr>
        <td>1</td>
        <td>Germany</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
    </tr>
    <tr>
        <td>2</td>
        <td>Sweden</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
    </tr>
    <tr>
        <td>3</td>
        <td>UK</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
    </tr>
    <tr>
        <td>4</td>
        <td>Germany</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
    </tr>
    <tr>
        <td>5</td>
        <td>Canada</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
    </tr>
    <tr>
        <td>6</td>
        <td>Italy</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
    </tr>
    <tr>
        <td>7</td>
        <td>UK</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
    </tr>
    <tr>
        <td>8</td>
        <td>France</td>
        <td>-</td>
        <td>-</td>
        <td>-</td>
    </tr>
</table> -->
<!-- <section class="container">
<div class="order">
    <span class="fa fa-search form-control-feedback"></span>
    <input class="col-md-6" id="myInput" type="search" class="light-table-filter" data-table="order-table" placeholder="Filter">
</div>
    <div class="scroll">
        <table class="order-table table table-dark table-striped">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Size</th>
                    <th>No Of Product</th>
                    <th>Order</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>john</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>jane</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Alfred</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
            </tbody>
        </table>
    </div>
</section> -->


<div class="order col-md-4 search">
    <span class="fa fa-search form-control-feedback"></span>
    <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filter">
</div>
<div class="scroll container-fluid">
    <table style="width: 100% !important;" class="order-table table table-dark table-striped">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Size</th>
                <th scope="col">No. Of Product</th>
                <th scope="col">Order</th>
            </tr>
        </thead>
        <tbody>
            <!-- rows will generate dynamically -->
            <!-- form Tag is added for placing order -->
           <%for(ThrededFittingBean tf : list){ %>
                <tr id="<%= tf.getId() %>">
                    <th scope="row"><%= tf.getId() %></th>
                    <td><%= tf.getProductName() %></td>
                    <td><%= tf.getProductSize() %></td>
                    <td><input type="text" id="<%= "Qty_"+tf.getId() %>" name="noOfproduct" value="<%= tf.getNoOfProduct() %>" placeholder="Number of Product"></td>
                   	<td><button class="btn btn-secondary" onclick="placeOrder(<%= tf.getId() %>,<%= "Qty_"+tf.getId() %>,`<%= tf.getProductName() %>`,`<%= tf.getProductSize() %>`,`<%=userid %>`,`<%=firstname%>`,`<%=lastname %>`)" >place Order</button></td>
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
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
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
function placeOrder(productId,productQuantityId,productName,productSize,userid,userfirstname,userlastname){
	const productQuantity = productQuantityId.value;
	if(productQuantity != null){
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  var res = this.responseText;
			  alert(res);
			  location.reload();
		  }
		  xhttp.open("GET", "ThrededOrderPlaced?productid="+productId+"&userid="+userid+"&userfirstname="+userfirstname+"&userlastname="+userlastname+"&productname="+productName+"&productsize="+productSize+"&productquantity="+productQuantity);
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
