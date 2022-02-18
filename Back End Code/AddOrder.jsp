<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,DAO.*,BeanClass.*" %>
<!doctype html>
<html lang="en">

<head>
 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
    <link rel="stylesheet" href="style.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <title>Add Order</title>
    <%
    	String firstname = (String) session.getAttribute("firstname");
    	String lastname =  (String) session.getAttribute("lastname");
    	String position = (String) session.getAttribute("position");
    	int userid = (Integer) session.getAttribute("userid");
    	Dao d = new Dao();	
    	List<ProductDetailBean> list = d.getAllProductDetails();
    %>
</head>
<body class="copybody">
<%@ include file="navbar.jsp" %>

<div class="pt-5">
<div class="order search pt-2">
        <input type="search" id="example1" class="light-table-filter haver" data-table="order-table"
            placeholder="Filter">
    </div>
      <div class="container-fluid">
        <div class="row mt-2">
            <div class="col-md text-center">
                <h1 class="pro fw-bolder">Add Order</h1>
            </div>
            <div class="col-md mt-4">
                <button class="btn btn-outline-secondary" onclick="addAllItemsToCart(`<%= userid %>`)">Add All Items</button>
            </div>
        </div>
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
               	<th scope="col">Product Type</th>
               	<th scope="col">Add Order</th>
                
            </tr>
        </thead>
        <tbody>
           
           <%
           		for(ProductDetailBean pd : list)
            {
            %>
                <tr id="<%= pd.getId() %>">
                    <td><%= pd.getId() %></td>
                    <td><%= pd.getProductname() %></td>
                    <td><%= pd.getProductsize() %></td>
                    <td><%= pd.getNoofproduct()  %></td>
                    <td><%= pd.getUnitprice() %></td>
                    <td><%= pd.getProducttype() %></td>
                   	<td><button class="btn btn-outline-secondary" onclick="AddOrder(`<%= pd.getId() %>`,`<%= pd.getProductname() %>`,`<%= pd.getProductsize()%>`,`<%=userid %>`,`<%= pd.getNoofproduct()%>`,`<%= pd.getUnitprice() %>`,`<%= pd.getProducttype() %>`)" >Add Order</button></td>
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
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="main.js"></script>
<script>
function addAllItemsToCart(userid){
	const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
		  var res = this.responseText;
		  alert(res);
		 
		}
	  const url = "AddAllItemsToCart";
	  xhttp.open("POST", url, true);
	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  xhttp.send("userid="+userid);
}
</script>
<script type="text/javascript">
function AddOrder(productid, productname, productsize, userid, totalproduct, unitprice, producttype){
	if(productname == ""){
		alert("product name cannot be empty");
	}
	
	else if(productsize == ""){
		alert("product size cannot be empty");
	}
	
	else if(totalproduct == ""){
		alert("total product cannot be empty");
	}
	
	else if(unitprice == ""){
		alert("product unit price cannot be empty");
	}
	
	
	
	const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  var res = this.responseText;
			  alert(res);
			 
			}
		  const url = "AddToCart?productid="+productid+"&productname="+productname+"&productsize="+productsize+"&userid="+userid+"&totalproduct="+totalproduct+"&unitprice="+unitprice+"&producttype="+producttype;
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
