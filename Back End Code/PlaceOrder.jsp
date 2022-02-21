<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel='stylesheet prefetch'
        href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <title>Place Order</title>
    <%
    String firstname = (String) session.getAttribute("firstname");
	String lastname =  (String) session.getAttribute("lastname");
	String position = (String) session.getAttribute("position");
	int userid = (Integer) session.getAttribute("userid");
	Dao d = new Dao();
	List<CartBean> list = d.getAllCartProductByUserId(userid);
	
    %>
</head>

<body class="copybody">
<%@ include file="navbar.jsp" %>

    <!--  logout model -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
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
                    <form action="Logout.html" method="post">
                        <input type="submit" value="Yes">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- My Order Page content-->
    <div class="pt-5">
        <div class="container-fluid">
            <h1 class="pro fw-bolder">Added Products</h1>
        </div>
        
    </div>
    <div class="scroll container-fluid">
        <table style="width: 100% !important;" class="order-table table  table-striped">
            <thead>
                <tr>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Size</th>
                    <th scope="col">Total Products</th>
                    <th scope="col">Products Required</th>
                    <th scope="col">Remove</th>
                </tr>
            </thead>
            <tbody>
            
               <%
               	for(CartBean cb : list){
               %>
               		<tr id="<%= cb.getCartid() %>">
               			<td ><%= cb.getProductname() %></td>
               			<td><%= cb.getProductsize() %></td>
               			<td><%= cb.getNoofproduct() %></td>
               			<td><input type="number" id="<%= "product_req"+cb.getCartid() %>" value="<%= cb.getProductquantity() %>" oninput="productRequired(`<%= cb.getId() %>`, <%= "product_req"+cb.getCartid() %>)"></td>
               			<td><button class="btn btn-outline-danger" onclick="removeElement(`<%=cb.getId()%>`)">Remove</button></td>
               		</tr>
               <%
               	} 
               %>
               
            </tbody>
        </table>
        <div class="col-md-12 text-center mb-3 mt-3">
            <button class="btn btn-outline-info mx-2" data-bs-toggle="modal" data-bs-target="#buy">
                Proceed to Buy
            </button>
            <button class="btn btn-outline-danger mx-2" data-bs-target="#" onclick= "removeAll(`<%= userid %>`)">
                Remove All
            </button>
        </div>
    </div>
    <!-- Modal Sign Up Start Here-->
    <div class="modal fade" id="buy" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Client Info</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    
                        <!--first Name input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="clientname" name="clientname" type="text" required>
                            <label for="clientname">Client name</label>

                        </div>
                        <!-- Email address input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="clientemail" name="clientemail" type="email" required>
                            <label for="clientemail">Client Email address</label>
                        </div>
                        
                        <!-- Address input-->
                        <div class="form-floating mb-3">
                            <textarea class="form-control" id="clientaddress" name="clientaddress" style="height: 10rem"
                                required></textarea>
                            <label for="clientaddress">Client Address</label>

                        </div>
                        <div class="d-grid">
                            <button class="btn btn-outline-info" onclick="placeOrder(`<%= userid %>`,`<%= firstname %>`, `<%= lastname %>`)">
                                Order
                            </button>
                        </div>
                  

                </div>
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
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    	function productRequired(productid,productreqId){
    		var productreqIdvalue = productreqId.value;
    		console.log(productreqIdvalue);
    		 if(productreqIdvalue == "" ){
    			alert("product required cannot be less than 1");
    		}
    		else{
    			const xhttp = new XMLHttpRequest();
      		  	xhttp.onload = function() {
      			  var res = this.responseText;
      			}
      		  const url = "UpdateProductRequired";
      		  xhttp.open("POST", url, true);
      		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      		  xhttp.send("productreq="+productreqIdvalue+"&productid="+productid);
    		}
    		
    	}
    </script>
    <script>
    	function removeElement(productid){
    		const xhttp = new XMLHttpRequest();
  		  	xhttp.onload = function() {
  			  var res = this.responseText;
  			  alert(res);
  			 location.reload();
  			}
  		  const url = "RemoveFromCart";
  		  xhttp.open("POST", url, true);
  		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  		  xhttp.send("productid="+productid);
	
    	}
    </script>
    <script>
		function removeAll(userid){
			const xhttp = new XMLHttpRequest();
  		  	xhttp.onload = function() {
  			  var res = this.responseText;
  			  alert(res);
  			 location.reload();
  			}
  		  const url = "RemoveAllFromCart";
  		  xhttp.open("POST", url, true);
  		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  		  xhttp.send("userid="+userid);
		}
    </script>
    <script>
    	function placeOrder(userid,userfirstname, userlastname){
    		var clientname = document.getElementById("clientname").value;
    		var clientemail = document.getElementById("clientemail").value;
    		var clientaddress = document.getElementById("clientaddress").value;
    		if(clientname=="" || clientemail=="" || clientaddress==""){
    			alert("client input fields cannot be empty");
    		}
    		else{
    			const d = new Date().toISOString().slice(0, 10);
    			console.log(d);
    			const t = new Date();
    			const orderplacedtime = t.getHours()+":"+t.getMinutes()+":"+t.getSeconds();
    			
    			const xhttp = new XMLHttpRequest();
      		  	xhttp.onload = function() {
      			  var res = this.responseText;
      			  alert(res);
      			 location.reload();
      			}
      		 const url = "PlaceOrder";
      		  xhttp.open("POST", url, true);
      		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      		  xhttp.send("userid="+userid+"&clientname="+clientname+"&clientemail="+clientemail+"&clientaddress="+clientaddress+"&userfirstname="+userfirstname+"&userlastname="+userlastname+"&orderplaceddate="+d+"&orderplacedtime="+orderplacedtime);
    		
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