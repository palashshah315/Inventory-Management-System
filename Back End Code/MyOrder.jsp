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
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <title>My Order</title>
    <%
    String firstname  = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");
    int user_id = (int) session.getAttribute("userid");
    String position = (String) session.getAttribute("position");
    
    Dao d = new Dao();
   List<OrderBean> list = d.getAllDetailsOfOrderDetailByUserId(user_id);
    %>
</head>
<body class="copybody">
<%@ include file="navbar.jsp" %>

<%--<!--  logout model -->--%>
<%--<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="exampleModalLabel">Logout</h5>--%>
<%--                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                Are you sure you want to logout?--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--                <form action="Logout.jsp" method="post">--%>
<%--                    <input type="submit" value="Yes"> --%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!-- My Order Page content-->
<div class="pt-5">
<div class="order search pt-2">
        <input type="search" id="example1" class="light-table-filter haver" data-table="order-table"
            placeholder="Filter">
    </div>
    <div class="container-fluid">
        <h1 class="pro fw-bolder">Your Orders</h1>
    </div>
</div>
<div class="scroll container-fluid">
    <table style="width: 100% !important;" class="order-table table  table-striped">
        <thead>
            <tr>
                <th scope="col">Employee Name</th>
                <th scope="col">Product Name</th>
                <th scope="col">Product Size</th>

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
	for(OrderBean ot : list){ 
%>

            <tr>
                <td><%=ot.getUserFirstName()+" "+ot.getUserLastName()%></td>
                <td><%=ot.getProductname() %></td>
                <td><%=ot.getProductsize()%></td>

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
                <%
                	String orderstat = ot.getOrderStatus();
                	if(orderstat.equals("Approved")){
                 %>
                <td><button class="btn btn-outline-danger" id="<%= "del_"+ot.getOrderid() %>"  disabled>Delete</button></td>
                <% } 
                	else{
                %>
                <td><button class="btn btn-outline-danger" id="<%= "del_"+ot.getOrderid() %>" onclick="deleteMyOrder(`<%= ot.getOrderid() %>`)">Delete</button></td>
                <%}%>
            </tr>
<%
}
%>
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
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="main.js"></script>
<script type="text/javascript">
function deleteMyOrder(orderid){
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		  var res = this.responseText;
		  alert(res);
		  location.reload();
		}
	const url = "DeleteMyOrder";
	xhttp.open("POST", url, true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("orderid="+orderid);
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