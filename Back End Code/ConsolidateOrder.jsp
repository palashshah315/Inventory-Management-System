<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Consolidate Order </title>
    <%
String firstname = (String) session.getAttribute("firstname");
String lastname =  (String) session.getAttribute("lastname");
String position = (String) session.getAttribute("position");
%>
</head>
<body>
	<!-- Navbar -->
    <%@ include file="navbar.jsp" %>
	<div class="container-fluid mt-5">
        <h1>Total Sales</h1>
        <div class="row">
            <div class="col">
                <label for="fromdate">From</label>
                <input type="date" name="date" id="fromdate">
            </div>
            <div class="col">
                <label for="todate">To</label>
                <input type="date" name="date" id="todate">
            </div>
        </div>
        <div class="row">
            <div class="col mt-3">
                <button class="btn btn-primary" id="salesBtn" onclick="consolidateOrder()">Get Consolidate Order</button>
            </div>
        </div>
    </div>
        <div class="scroll container-fluid mt-5" >
           <table style="width: 100% !important;" class="order-table table table-striped">
           		<thead>
           				<tr id="tablehead">
           					
                			
           				</tr>
           		</thead>
           </table>
        </div>
    

    <hr class="dropdown-divider">
    <footer class="py-4 mt-auto">
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
   
    <script>
    		 function consolidateOrder(){
    			 var fromdate = document.getElementById("fromdate").value;
    			 var todate = document.getElementById("todate").value;
    			 if(fromdate==null || todate==null || fromdate==""|| todate==""){
    				 alert("Please select dates");
    			 }
    			 else{
    				 const xhttp = new XMLHttpRequest();
    				  xhttp.onload = function() {
    					  var res = JSON.parse(this.responseText);
    					  console.log(res);
    				}
    				  
    				const url = "ConsolidateOrder";
    				xhttp.open("POST", url, true);
    				xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    				xhttp.send("fromdate="+fromdate+"&todate="+todate);
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