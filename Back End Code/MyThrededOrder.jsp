<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DAO.*,BeanClass.*,java.util.*" %>
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
    <link rel='stylesheet prefetch'
        href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <title>My Order</title>
    <%
    String firstname  = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");
    int user_id = (int) session.getAttribute("userid");
    String position = (String) session.getAttribute("position");
    
    Dao d = new Dao();
    List<OrderThrededFittingBean> list = d.getAllDetailsOfOrderThrededFittingByUserId(user_id);
    %>
</head>

<!-- Navbar -->
<nav class="__nav navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="container pr-5">
        <a class="navbar-brand" href="index.jsp">Fitwel Industries</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Product</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ThrededFitting.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="GroovedFittings.jsp">Grooved Fittings</a></li>
                        <li><a class="dropdown-item" id="addproduct" href="AddProduct.jsp">Add Product</a>
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
                <li class="nav-item"><a class="nav-link" href="InvoiceGenerate.jsp">Invoice</a></li>
               	<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><%= firstname %> <%= lastname %></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <li><a class="dropdown-item" href="yourProfile.jsp">Your Profile</a></li>
                        <li><a class="dropdown-item" href="ResetPassword.jsp">Reset Password</a></li>
                       	<li> <a class="dropdown-item" id="employeedetail" href="employeedetail.jsp">Employee Details</a></li>
                        <li><a type="button" class="dropdown-item" data-toggle="modal"
                                data-target="#exampleModal">Logout</a></li>
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

<!-- My Order Page content-->
<div class="container-fluid">
    <h2 class="pro mt-5"><b>My  Orders</b></h2>
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
                <th scope="col">Approved Date</th>
                <th scope="col">Approved Time</th>
                <th scope="col">Order Status</th>
                <th scope="col">Invoice Status</th>
                <th scope="col">Delete Order</th>
            </tr>
        </thead>
        <tbody>
            <!-- form tag is added for placing order
rows will generate dynamically -->
<% 
	for(OrderThrededFittingBean ot : list){ 
%>

            <tr>
                <td><%=ot.getOrderId()%></td>
               	<td><%=ot.getProductId()%></td>
                <td><%=ot.getUserId()%></td>
                <td><%=ot.getUserFirstName()+" "+ot.getUserLastName()%></td>
                <td><%=ot.getProductsize()%></td>
                <td><%=ot.getTotalProduct()%></td>
                <td><%=ot.getProductrequired()%></td>
                <td><%=ot.getTotalProductPrice()%></td>
                <td><%=ot.getclientName()%></td>
                <td><%=ot.getClientAddress()%></td>
                <td><%=ot.getClientEmail()%></td>
                <td><%=ot.getOrderPlacedDate()%></td>
                <td><%=ot.getOrderPlacedTime()%></td>
                <td><%=ot.getApprovalDate()%></td>
                <td><%=ot.getApprovalTime() %></td>
                <td><%=ot.getOrderStatus() %></td>
                <td><%=ot.getInvoiceStatus() %></td>
                <td><button class="btn btn-primary" id="<%= "del_"+ot.getOrderId()%>" onclick="deleteMyOrder(`<%= ot.getOrderId() %>`,`<%= ot.getProductrequired()%>`,`<%= ot.getTotalProduct()%>`,`<%= ot.getProductId()%>`)">Delete</button></td>
            </tr>
<%
}
%>
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
	const url = "DeleteMyThrededOrder";
	xhttp.open("POST", url, true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("orderid="+orderid+"&productreq="+productreq+"&totalproduct="+totalproduct+"&productid="+productid);
}
</script>
<!-- for valdation if employee login then these both fields are none -->
<%
    if(position.equals("Employee")){

%>
<script>
document.getElementById("addproduct").style.display = "none";
document.getElementById("employeedetail").style.display = "none";
</script> 
<%}%>
</body>

</html>