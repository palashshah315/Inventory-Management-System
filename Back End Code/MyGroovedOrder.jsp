<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@page import="DAO.*,BeanClass.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grooved Order</title>
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <%
    	String firstname = (String) session.getAttribute("firstname");
    	String lastname =  (String) session.getAttribute("lastname");
    	String position = (String) session.getAttribute("position");
    	int user_id = (Integer) session.getAttribute("userid");
    	Dao d = new Dao();
    	List<OrderGroovedFittingBean> list = d.getAllDetailsOfOrderGroovedFittingByUserId(user_id);
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
                        data-bs-toggle="dropdown" aria-expanded="false">Approval</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ApproveThreded.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="ApproveGrooved.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">My Order</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="MyThrededOrder.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="MyGroovedOrder.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Invoice</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button"
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
<div class="container-fluid">
    <h2 class="pro mt-5"><b>My Grooved Orders</b></h2>
</div>
<div class="scroll container-fluid">
    <table style="width: 100% !important;" class="order-table table table-dark table-striped">
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
                <th scope="col">Approval Date </th>
                <th scope="col">Approval Time</th>
                <th scope="col">Order Status</th>
                <th scope="col">Invoice Status</th>
                <th scope="col">Delete Order</th>
            </tr>
        </thead>
        <tbody>
            <!-- form tag is added for placing order
rows will generate dynamically -->

		<% for(OrderGroovedFittingBean og : list)
		{
		%>
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
                <td><button class="btn btn-primary" id="<%= "del_"+og.getOrderId() %>" onclick="deleteMyOrder(`<%= og.getOrderId() %>`,`<%= og.getProductrequired()%>`,`<%= og.getTotalProduct()%>`,`<%= og.getProductId()%>`)">Delete</button></td>
            </tr>
         <%} %>
        </tbody>
    </table>
</div>
<!-- Footer -->
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
                <div class="big m-0 text-white">âCopyright Â© Fitwel Industries."</div>
            </div>
        </div>
    </div>
</footer>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
</body>
</html>