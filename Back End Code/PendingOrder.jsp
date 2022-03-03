<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, BeanClass.*, DAO.*" %>
<html>
    <head>
        <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">
  

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Pending Order</title>
    <%
        String firstname = (String) session.getAttribute("firstname");
        String lastname =  (String) session.getAttribute("lastname");
        String position = (String) session.getAttribute("position");
        Dao d = new Dao();
        List<String> list = d.getAllClientName();
        		
    %>
    </head>
    <body>
       <!-- Navbar -->
       <%@ include file="navbar.jsp" %>        
        <div class="pt-5">
            <div class="order search pt-2 mt-3">
                <select  class="effect1" id="customername" onchange="getDetailsFromCustomerName()">
                    <option value="">Select a customer name </option>
                    <%
                    	for(String s : list){
                    %>
                    	<option value="<%= s %>"><%= s %></option>
                    <%
                    	} 
                    %>
                  </select>
                  </div>
                <div class="container-fluid">
                   <div class="row mt-5">
                   		 <h1 class="pro fw-bolder">Pending Order</h1>
                   </div>
                </div>
               
            </div>
          <div class="table-responsive mt-4">
                        <table class="table table-lg table-striped" id="demo">
                            <thead>
                                <tr>
                                    <th>Item Description</th>
                                    <th>Product Required</th>
                                    <th>Order Placed Date</th>
                                    <th>Total Product</th>
                                   
                                </tr>
                            </thead>
                            <tbody id="tablebody">
                               		
                            </tbody>
                        </table>
                    </div>
                    <div class="container-fluid">
                    	<div class="row">
                    		<div class="col-lg">
                    			<p id="title"> Total Product Required :- </p>
                    			<p id="totalsum"></p>
                    		</div>
                    	</div>
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
                <div class="big m-0">“Copyright ©️ Fitwel Industries."</div>
            </div>
        </div>
    </div>
</footer>

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	function getDetailsFromCustomerName(){
    		var customername = document.getElementById("customername").value;
    		console.log(customername);
    		if(customername == ''){
    			alert("please select a customername");
    			 document.getElementById("tablebody").innerHTML = "";
    			 document.getElementById("totalsum").innerHTML = "";
    			 document.getElementById("title").innerHTML = "";
    		}
    		
    		else{
    			 const xhttp = new XMLHttpRequest();
    			 
    			  xhttp.onload = function() {
    				  
    				  var res = JSON.parse(this.responseText);
    				  console.log(res);	
    				  
    				  if(res == ''){
    					  alert("Sorry data not found");
    					  document.getElementById("tablebody").innerHTML = "";
    					  document.getElementById("totalsum").innerHTML = "";
    					  document.getElementById("title").innerHTML = "";
    				  }
    				  
    				  else{
    					  var row = "";
    					  var totalsum=0;
    					  for(var i=0;i<res.length;i++){
    						  var sum=0;
    						  row+="<tr>";
    						  row+="<td>"+res[i].productname+" "+res[i].productsize+"</td>";
    						  row+="<td>"+res[i].productrequired+"</td>";
    						  sum+=res[i].productrequired;
    						  totalsum+=sum;
    						  row+="<td>"+res[i].orderplaceddate+"</td>";
    						  row+="<td>"+sum+"</td>";
    						
    						  row+="</tr>";
    						  
    					  }
    					  
    					  document.getElementById("tablebody").innerHTML = row;
    					  document.getElementById("totalsum").innerHTML = totalsum
    					  
    				}
    				  
    			  }
    			const url = "PendingOrder";
  				xhttp.open("POST", url, true);
  				xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  				xhttp.send("customername="+customername);
    		}
    	}
    </script>
    </body>
    </html>