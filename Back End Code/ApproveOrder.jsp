<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,BeanClass.*,DAO.*" %>
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
<title>Approved Threded</title>
	<%
	String firstname = (String) session.getAttribute("firstname");
	        String lastname =  (String) session.getAttribute("lastname");
	        String position = (String) session.getAttribute("position");
	        Dao d = new Dao();
	        List<OrderBean> list = d.getAllApprovalDetails();
	%>
</head>
<body class="copybody">
<%@ include file="navbar.jsp" %>
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
        <h1 class="pro fw-bolder">Approval Details</h1>
    </div>
</div>
<div class="scroll container-fluid">
    <table style="width: 100% !important;" class="order-table table table-striped">
        <thead>
            <tr>
                <th scope="col">Employee Name</th>
                <th scope="col">Product Name</th>
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
         	<%
         	for (OrderBean ot : list){
         	%>
            	<tr>
                <td><%=ot.getUserFirstName()+" "+ot.getUserLastName()%></td>
                <td><%=ot.getProductname() %></td>
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
                <%
                	String orderstat = ot.getOrderStatus();
                	if(orderstat.equals("Approved")){
                 %>
                <td><button class="btn btn-outline-danger" id="<%= "del_"+ot.getOrderid() %>"  disabled>Reject</button></td>
               
                <% } 
                	else{
                %>
                <td><button class="btn btn-outline-danger" id="<%= "del_"+ot.getOrderid() %>" onclick="deleteOrder(`<%= ot.getOrderid() %>`,`<%= position%>`)">Reject</button></td>
                 
                <%}%>
                <%
                	if(orderstat.equals("Approved")){
                %>
                <td><button class="btn btn-outline-secondary" disabled>Approved</button></td>	
            	<%
            	}
                	else
            		{
            	%>
            	<td><button class="btn btn-outline-secondary" onclick="approvalProduct( `<%=ot.getOrderid()%>`,`<%=position%>`)">Approved</button></td>	
            	<%} %>
            	</tr>
            <% } %>
        </tbody>
    </table>
   
</div>
 <div class="container-fluid">
    	<div class="row">
    		<div class="col-md-12 text-center mt-4">
    			<button class="btn btn-outline-danger text-center" id="rejectAll" onclick="rejectAll(`<%= position %>`)">Reject All</button>
    			<button class="btn btn-outline-secondary text-center" id="approveAll" onclick="approveAll(`<%= position %>`)">Approve All</button>
    			
    		</div>
    		
    	</div>
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
<script>
function rejectAll(position){
	if(position == "Employee"){
		
		alert("You are not Allowed to Reject order!!");
	}
	else{
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			  var res = this.responseText;
			  alert(res);
			  location.reload();
			}
		const url = "DeleteAllOrder";
		xhttp.open("POST", url, true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send();
		
	}
}
</script>
<script type="text/javascript">
function deleteOrder(orderid,position){
if(position == "Employee"){
		
		alert("You are not Allowed to Reject order!!");
	}
	
else{
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
		  const url = "ApproveOrder?orderid="+orderid+"&orderstatus="+orderstatus+"&approvedate="+approvedate+"&approvetime="+approvetime;
		  xhttp.open("GET",url);
		  xhttp.send();
	}
}

</script>
<script>
function approveAll(position){
	if(position == 'Employee'){
		alert("You are not allowed to approve orders");
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
		  
		  const url = "ApproveAllOrder?orderstatus="+orderstatus+"&approvedate="+approvedate+"&approvetime="+approvetime;
		  xhttp.open("GET",url);
		  xhttp.send();
	}
}
</script>
</body>
</html>