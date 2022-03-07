<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
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
    
	<div class="container-fluid mt-5 pt-5">
        
        <div class="row">
        <h1>Consolidate Order</h1>
            <div class="col-lg">
                <label for="fromdate">From</label>
                <input type="date" name="date" id="fromdate" class="mb-3 " >
            </div>
            <div class="col-lg">
                <label for="todate">To</label>
                <input type="date" name="date" id="todate" class="ms-3" >
                
                
            </div>
        </div>
        <div class="row">
            <div class="col mt-3">
                <button class="btn btn-primary" id="salesBtn" onclick="consolidateOrder()">Get Consolidate Order</button>
            </div>
            <div class="col mt-3">
                <button class="btn btn-primary" onclick="allConsolidateOrder()">Get All Consolidate Order</button>
            </div>
        </div>
    </div>
        <div class="scroll container-fluid mt-5" >
           <table style="width: 100% !important;" class="order-table table table-striped">
           		<thead >
           			<tr id="tablehead">
           				
           			</tr>
           					
                		
           		</thead>
           		<tbody id="tablebody">
           			
           		</tbody>
           </table>
        </div>
    <div class="container-fluid">
    	<div class="row">
    		<div class="col-lg-6  ">
    			
    		</div>
<%--    		<div class="col-lg-6 ">--%>
<%--    			<p class="text-end " id="totalsum"></p>--%>
<%--    		</div>--%>
    	</div>
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
    

 function tableHeader(res) {
     debugger;
      var col = "<th> Item Description </th>";
 
      for(var i=0;i<Object.keys(res[0]).length;i++){

          if(Object.keys(res[0])[i] != "productsize")
            if(Object.keys(res[0])[i] != "productname")
              col+="<th>"+Object.keys(res[0])[i]+"</th>";
      }

      	
      col+="<th> PENDING </th>";
     
      return col;
  }
   
 function tableBody(res){
	var row = "";
	var sum=0;
	var totalsum=0;
    const columnNames = Object.keys(res[0]);
    debugger;
	for(var i=0;i<res.length;i++){
		
		row+="<tr>";
		
		//row+="<td>"+res[i][Object.keys(res[0])[Object.keys(res[0]).length-1]]+" "+res[i][Object.keys(res[0])[Object.keys(res[0]).length-2]]+"</td>";
        row+="<td>" + res[i].productname + ' ' + res[i].productsize + "</td>";
		sum=0;
		for(var j=0;j<Object.keys(res[i]).length;j++){
            if(Object.keys(res[0])[j] != "productsize" && Object.keys(res[0])[j] != "productname") {
                row+="<td>"+res[i][Object.keys(res[0])[j]]+"</td>";
			    sum+=Number(res[i][Object.keys(res[0])[j]]);

            }
		}
		row+="<td>"+sum+"</td>"
		
		totalsum+=sum;

		row+="</tr>";

	}

     row+="<tr>";
     row+="<td>TOTAL</td>";
     for(var j=0;j<Object.keys(res[0]).length;j++) {
         if (Object.keys(res[0])[j] != "productsize" && Object.keys(res[0])[j] != "productname") {
             row+="<td>" + res.reduce((a, b) => Number(a) + Number(b[Object.keys(res[0])[j]]), 0).toString() + "</td>";
         }
     }
     row+="<td>" + totalsum.toString() + "</td>";
     row+="</tr>";

     //document.getElementById("totalsum").innerHTML = totalsum;
	return row;
	
 }

 function allConsolidateOrder(){
	 
	 const xhttp = new XMLHttpRequest();
	 
	 xhttp.onload = function() {
		  var res = JSON.parse(this.responseText);
		  if(res == ''){
			  alert("Sorry data not found!");
		  }
		  else{
              document.getElementById("tablehead").innerHTML = "";
              document.getElementById("tablebody").innerHTML = "";

			  var tablehead = tableHeader(res);
			  
			  document.getElementById("tablehead").innerHTML = tablehead;
			  var tablebody = tableBody(res);
			  
			  document.getElementById("tablebody").innerHTML = tablebody;
		  }
		  
	}
	 	const url = "AllConsolidateOrder";
	 	xhttp.open("GET", url, true);
		xhttp.send();
 }
 
 
 function consolidateOrder(){
    			 var fromdate = document.getElementById("fromdate").value;
    			 var todate = document.getElementById("todate").value;
    			 
    			 if(fromdate==null || todate==null || fromdate==""|| todate==""){
    				 alert("Please select dates");
    			 }
    			 
    			 else{
    				 const xhttp = new XMLHttpRequest();
    				  xhttp.onload = function() {
    					  const res = JSON.parse(this.responseText);
    					  
    					  if(res == ''){
    						  alert("Sorry data not found!");
    					  }
    					  
    					  else{
    						  document.getElementById("tablehead").innerHTML  = "";
    						  document.getElementById("tablebody").innerHTML = "";
    						  
    						  var tablehead = tableHeader(res);
    						  
        					  document.getElementById("tablehead").innerHTML = tablehead;
        					  var tablebody = tableBody(res);
        					  
        					  document.getElementById("tablebody").innerHTML = tablebody;
    					  }
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