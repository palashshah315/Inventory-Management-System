<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="DAO.*,java.util.*,BeanClass.*" %>
<!doctype html>
<html lang="en">
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  -->
    
    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Threded Fittings</title>
    <%
    	String firstname = (String) session.getAttribute("firstname");
    	String lastname =  (String) session.getAttribute("lastname");
    	String position = (String) session.getAttribute("position");
    	Dao d = new Dao();
    	List<ProductDetailBean> list = d.getAllProductDetails();
    	
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
        <input type="search" id="myInput" class="light-table-filter haver" data-table="order-table"
            placeholder="Filter">
    </div>
    <div class="container-fluid">
        <h1 class="pro fw-bolder">Product Details</h1>
    </div>
</div>
<div class="scroll container-fluid">
<table class="table table-striped container" id="fittings">
    <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">SIZE (in inches)</th>
          
            <th scope="col">Product unit price (in rupees)</th>
            <th scope="col">Product Type</th>
        </tr>
    </thead>
    <tbody id="myTable">
    	<%
    	for(ProductDetailBean pd : list)
    	{
    	%>
    		<tr id="<%= pd.getId() %>">
    			<td><%= pd.getProductname() %></td>
    			<td><%= pd.getProductsize() %></td>
    			<td><%= pd.getUnitprice() %></td>
    			<td><%= pd.getProducttype() %></td>
    			
        	</tr>
        <%} %>
    </tbody>
</table>
</div>
<!-- Footer -->
<hr class="dropdown-divider">
<footer class="py-5 mt-3">

    <div class="container px-2 mt-auto">
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

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
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