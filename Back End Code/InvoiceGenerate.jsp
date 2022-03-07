<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        type="text/css" media="all" />
    <link rel="stylesheet" href="style.css" />
    <script src="https://kit.fontawesome.com/4561262c83.js" crossorigin="anonymous"></script>
    <!-- <script src="order.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">
    <title>Invoice</title>
    <%
    String uname = (String) session.getAttribute("username");
	String pswd=(String) session.getAttribute("password");


	if(uname == null || pswd==null){
		out.println("<script type = \"text/javascript\">");
		out.println("alert('Please Login First');");
		out.println("</script>");	
		out.println("<meta http-equiv=\"Refresh\" content=\"0;url=index.jsp\">");
	}
	
    String firstname = (String) session.getAttribute("firstname");
	String lastname =  (String) session.getAttribute("lastname");
	String position = (String) session.getAttribute("position");
	String useremail = (String) session.getAttribute("email");
	
	List<String> list = new ArrayList<>();
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims","root","root");
		String sql = "select `clientname` from `ims`.`orderdetail` where `invoicestatus`= 'pending' group by clientname";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next()){
			list.add(rs.getString("clientname"));
		}
	}catch(Exception e){e.printStackTrace();}
	
	
    %>
    
</head>
<body class="copybody">
<!-- Navbar -->
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
<div >
 <!-- Invoice Page content-->
    <div class="container d-flex justify-content-center mt-50 mb-50 py-5">
        <div class="row" >
            <!-- <div class="col-md-12 text-right mb-3">
                <button class="btn btn-primary" id="download">Download Invoice</button>
            </div> -->
            <div class="col-md-12">
                <div class="card" id="invoice">
                    <div class="card-header bg-transparent header-elements-inline">
                        <img class="logoimage" src="logo.png" alt="logo">
                        <h6 class="card-title text-primary fw-bolder">Fitwell Industries</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-4 mb-md-2 text-left">
                                   <select id="select" onchange="getInvoiceDetails()">
                                   <option value="">Select Customer Name</option>
                                       <%
                                       		for(String s : list){
                                       %>
                                       	<option value="<%= s %>"><%= s %></option>
                                       	<%} %>
                                   </select>

                                </div>
                                <div>
                                	<p id="clientname"></p>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="mb-4 ">
                                    <div class="text-sm-right">
                                        <ul class="list list-unstyled mb-0">
                                            <li>
                                                <h5 class="my-2"><b>PLACE OF DELIVERY</b></h5>
                                            </li>
                                            <li id="address">
                                            	
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex-md-wrap">
                            <div class="mb-2 ml-auto">
                                <div class="flex-wrap wmin-md-400">

                                    <ul class="list list-unstyled text-center mb-0 ml-auto">
                                        <li>Purchase Order <p id="orderid"></p></li>
                                       	<li>Client Email <p id="clientemail"></p></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-lg table-striped" id="demo">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Product Size(in inches)</th>
                                    <th>Rate</th>
                                    <th>Quantity</th>
                                    <th>Total Price</th>

                                </tr>
                            </thead>
                            <tbody id="tablebody">
                               		
                            </tbody>
                        </table>
                    </div>
                    <div class="card-body line">
                        <div class="d-md-flex flex-md-wrap">
                            <div class="pt-2 mb-3 wmin-md-400 ml-auto">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th class="text-left">Subtotal:</th>
                                                <td class="text-right" id="subtotal">0</td>
                                            </tr>
                                            <tr>
                                                <th class="text-left">Packing and Forwarding:</th>
                                                <td class="text-right" id="packingandforwarding">0</td>
                                            </tr>
                                            <tr>
                                                <th class="text-left">Central GST Payable <span
                                                        class="font-weight-normal">(9%)</span>:</th>
                                                <td class="text-right" id="centralgst">0</td>
                                            </tr>
                                            <tr>
                                                <th class="text-left">State GST Payable <span
                                                        class="font-weight-normal">(9%)</span>:</th>
                                                <td class="text-right" id="stategst">0</td>
                                            </tr>
                                            <tr>
                                                <th class="text-center">Total Value:</th>
                                                <td class="text-right text-primary">

                                                    <h5 class="font-weight-semibold" id="totalvalue">0</h5>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="text-center " id="download"> <button type="button" class="btn btn-primary"><b><i class="fa fa-paper-plane-o mr-1"></i></b>
                            Print invoice</button>  -->
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-4 mb-md-2 mx-5 text-left">
                                <ul class="list list-unstyled mb-0 mt-3">
                                    <li>MODE OF TRANSPORT : SEENU TRANSPORT</li>
                                    <li>DESTINATION : CHENNAI</li>
                                    <li>FRIEGHT : TO PAY</li>
                                    <li>PAYMENT : IMMEDIATE DIRECT</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="mb-4">
                                <div class="just">
                                    <ul class="list list-unstyled mb-0">
                                        <li>
                                            <h5 class="my-2 text-left"><b>Fitwell Industries</b></h5>
                                        </li>
                                        <li>SF NO 535/7, KOLLUPALAYAM,</li>
                                        <li>KANIYUR,COIMBATORE,</li>
                                        <li>TAMILNADU,INDIA - 641659.</li>
                                        <li>GST.NO : 33AOMPD8041C1ZD</li>
                                        <li>STATE CODE : 33</li>
                                        <li>HSN CODE : 73071120</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="line">
                    </div>
                    <p class="mx-2">Certified that the particulars given above are true and correct, the amount
                        indicated
                        represents the price actually charged and that there is no flow
                        of additional consideration directly or indirectly from the buyer.
                    </p>
                    <div class="line"></div>
                    <div class="row just1">
                        <p class="ml-4">Prepared By</p>
                        <p class="space">Checked By</p>
                        <p class="mr-4">Authorized Signature</p>
                    </div>
                    <div class="line"></div>
                    <p>* Subject to Coimbatore Jurisdication Only.
                    </p>
                    <div class="line"></div>
                    <div class="col-md-12 text-center mb-3 mt-3">
                        <button class="btn btn-outline-info"  id="download" onclick="generatePDF()">
                           Generate PDF
                        </button>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function getPDF(){
		
		  const invoice = document.getElementById("invoice");
          console.log(invoice);
          console.log(window);
         
          var opt = {
              margin: 1,
              filename: 'invoice.pdf',
              image: { type: 'jpg', quality:  0.97},
              html2canvas: { scale: 2 },
              jsPDF: { unit: 'in', format: 'A3', orientation: 'portrait' }
          };
          
          html2pdf().from(invoice).set(opt).save();
          
	      
	}
	function generatePDF(){
		document.getElementById("select").style.display="none";
		document.getElementById("download").style.display="none";
		const invoicestatus = "generated";
		
		const clientname = document.getElementById("select").value;
		if(clientname == ""){
			alert("please select clientname");
		}
		
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  var res = this.responseText;
			  document.getElementById("select").style.display="visible";
			  document.getElementById("download").style.display="visible";
			  alert(res);
			  getPDF();

		}
		  
		const url = "InvoiceStatus";
		xhttp.open("POST", url, true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("invoiceStatus="+invoicestatus+"&clientname="+clientname);
	}
</script>
<script>
	function getInvoiceDetails(){
		var value = document.getElementById("select").value;
		document.getElementById("tablebody").innerHTML="";
		document.getElementById("address").innerHTML="";
		document.getElementById("clientname").innerHTML="";
		document.getElementById("clientemail").innerHTML="";
		document.getElementById("orderid").innerHTML="";
		var text = "",sum=0;
		if(value == ""){
			alert("please select customer name");
			document.getElementById("tablebody").innerHTML="";
			document.getElementById("address").innerHTML="";
			document.getElementById("clientname").innerHTML="";
			document.getElementById("clientemail").innerHTML="";
			document.getElementById("orderid").innerHTML="";
			document.getElementById("subtotal").innerHTML = "0";
			document.getElementById("packingandforwarding").innerHTML = "0";
			document.getElementById("centralgst").innerHTML = "0";
			document.getElementById("stategst").innerHTML = "0";
			document.getElementById("totalvalue").innerHTML = "0";
		}
		else{
			const xhttp = new XMLHttpRequest();
			  xhttp.onload = function() {
				  var res = JSON.parse(this.responseText);
				  
				  document.getElementById("address").innerHTML=res[0].clientaddress;
				  document.getElementById("clientname").innerHTML = "Client Name :- "+res[0].clientname;
				  document.getElementById("clientemail").innerHTML = res[0].clientemail;
				  document.getElementById("orderid").innerHTML = res[0].invoiceid;
				  
				  for(var i=0;i<res.length;i++){


					  var obj = res[i];
					  text = "<tr>";
					  text+= "<td>"+obj.productname+"</td>";
					  text+= "<td>"+obj.productsize+"</td>"
					  var unitrate = obj.totalproductprice/obj.productrequired;
					  text+= "<td>"+unitrate+"</td>";
					  text+= "<td>"+obj.productrequired+"</td>";
					  text+= "<td>"+obj.totalproductprice+"</td>";
					  sum+=obj.totalproductprice;
				  	  text+= "</tr>";
				  	  document.getElementById("tablebody").innerHTML = document.getElementById("tablebody").innerHTML + text;
				  }
				  document.getElementById("subtotal").innerHTML = sum;
				  document.getElementById("packingandforwarding").innerHTML = sum;
				  var cgst = (sum * 9)/100;
				  var sgst = (sum * 9)/100;
				  
				  document.getElementById("centralgst").innerHTML = cgst;
				  document.getElementById("stategst").innerHTML = sgst;
				  var totalvalue = sum+sum+cgst+sgst;
				  document.getElementById("totalvalue").innerHTML = totalvalue;


				}
			 const url = "GenerateInvoice";
			 xhttp.open("POST", url, true);
			 xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			 xhttp.send("clientname="+value);
		}
		
	}
</script>
<%
if(position.equals("Employee")){
%>
<script>
document.getElementById("employeedetail").style.display="none";
document.getElementById("addproduct").style.display="none";
</script>
<%
}
%>
</body>
</html>