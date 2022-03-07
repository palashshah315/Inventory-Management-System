<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,DAO.*,BeanClass.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' >
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>Order Form</title>
	<link rel='stylesheet' type='text/css' href="order-form-css.css" >
	<link rel='stylesheet' type='text/css' href="editabelinvoiceprint.css" >
    <link rel='stylesheet' type='text/css' href="style.css" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
     <%

        String firstname = (String) session.getAttribute("firstname");
        String lastname =  (String) session.getAttribute("lastname");
        String position = (String) session.getAttribute("position");
       	int user_id = (Integer) session.getAttribute("userid");

     %>

</head>
<body>
<%@ include file="navbar.jsp" %>

      <section class="bottom">
        <div id="page-wrap">

            <div class="container-fluid">
            	<div class="row">
                    <p>* Note this is not for mobile view</p>
            		<img class="img-fluid w-100 h-25" src="0001.jpg">
            	</div>
            </div>

            <div class="mt-3" id="customer">
                <div class="mx-2" id="customer-details">
                    <input class="my-2 py-1" type="text" id="customer-name" placeholder="CLIENT NAME" >
                    <input class="mb-2 py-1" type="email" id="customer-email" placeholder="CLIENT EMAIL" >
                    <textarea id="customer-address" rows="4" cols="51" placeholder="CLIENT ADDRESS" ></textarea>

                </div>


                <table class="mx-2" id="meta">
                    <tr>
                        <td class="meta-head">PO NO #</td>
                        <td><input type="text" id="invoice-no" placeholder="000123"></td>
                    </tr>
                    <tr>

                        <td class="meta-head">DATE</td>
                        <td><input type="date" id="order-date" ></td>
                    </tr>
                    <!-- <tr>

                        <td class="meta-head">CONTACT</td>
                        <td><textarea id="date">8124408604</textarea></td>
                    </tr>
                    <tr>

                        <td class="meta-head">GST NO.</td>
                        <td><textarea id="date">33AOMPD8041C1ZD</textarea></td>
                    </tr> -->

                </table>

            </div>

            <table id="items">

                <tr>
                    
                    <th>Item Name</th>
                    <th>Item Size</th>
                    <th>Unit Cost</th>
                    <th>Quantity</th>
                    <th>Price (in Rs.)</th>
                </tr>

                <tr class="item-row">
                    
                    <td class="item-name">
                        <input placeholder="Item Name And Description" type="text">
                    </td>
                    <td class="description">
                        <input placeholder="Item Size" type="text">
                    </td>
                    <td><input type="number" class="cost" value="00"></td>
                    <td><input type="number" class="qty" value="0"></td>
                    <td><span class="price">0</span></td>
                </tr>

                <tr>
                    <td colspan="5"><a id="addrow" href="javascript:;" title="Add a row">Add a row</a></td>
                </tr>

                <tr>
                    <td colspan="2" class="blank"> </td>
                    <td colspan="2" class="total-line">Subtotal</td>
                    <td class="total-value">
                        <div id="subtotal">00</div>
                    </td>
                </tr>
               <!--  <tr>

                    <td colspan="2" class="blank"> </td>
                    <td colspan="2" class="total-line">Total</td>
                    <td class="total-value">
                        <div id="total">00</div>
                    </td>
                </tr> -->
                <!-- <tr>
                    <td colspan="2" class="blank"> </td>
                    <td colspan="2" class="total-line">Amount Paid</td>

                    <td class="total-value"><textarea id="paid">0.00</textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="blank"> </td>
                    <td colspan="2" class="total-line balance">Balance Due</td>
                    <td class="total-value balance">
                        <div class="due">00</div>
                    </td>
                </tr> -->

            </table>

            <div class="text-center my-3">
                <!-- <h5 class="mx-2">For FITWEL INDUSTRIES,</h5>
                <p class="margin-top mx-2">__________________</p>
                <p class="mx-2">Authorized Signatory.</p> -->
                <button type="button" class="btn btn-outline-info" onclick="placeOrder(`<%= user_id%>`,`<%= firstname %>`, `<%= lastname %>`)">Add Order</button>
                
            </div>

        </div>
    </section>
        <script type="text/javascript">
            function placeOrder(userid, userfirstname, userlastname){

                var table = document.getElementById("items");
                var rows = table.querySelectorAll("tr");
                const d = new Date();

                const ordertime = d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
                var items = [];
                const month = d.getMonth()+1;


                for (var i = 1; i < rows.length-2; i++) {
                    var cols = rows[i].querySelectorAll("td");
                    items.push( {
                        productname : cols[0].querySelector("input").value,
                        productsize : cols[1].querySelector("input").value,
                        unitcost : cols[2].querySelector("input").value,
                        quantity : cols[3].querySelector("input").value,
                        price: cols[4].querySelector("span").innerText

                    });

                }

                const clientname = document.getElementById("customer-name").value;
                const clientemail = document.getElementById("customer-email").value;
                const clientaddress = document.getElementById("customer-address").value;
                const invoiceno = document.getElementById("invoice-no").value;
                const orderplaceddate = document.getElementById("order-date").value;
                const orderplacedtime = ordertime;
                const approvedate = d.getFullYear()+"-"+month+"-"+d.getDate();
                const approvetime = d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
                const orderstatus = "Approved";
                const totalprice = document.getElementById("subtotal").innerText;

                var stringProductDetail = JSON.stringify(items);


                console.log(stringProductDetail.length);
                const xhttp = new XMLHttpRequest();

                xhttp.onload = function() {
                    var res = this.responseText;
                    alert(res);
                    location.reload();
                }

                const url = "Servlet";
                xhttp.open("POST", url, true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("orderdetails="+stringProductDetail+"&userid="+userid+"&userfirstname="+userfirstname+"&userlastname="+userlastname+"&clientname="+clientname+"&clientemail="+clientemail+"&clientaddress="+clientaddress+"&invoiceno="+invoiceno+"&orderplaceddate="+orderplaceddate+"&orderplacedtime="+orderplacedtime+"&approvedate="+approvedate+"&approvetime="+approvetime+"&orderstatus="+orderstatus+"&totalprice="+totalprice);
            }
    
    </script>
    <script type='text/javascript' src='jquery-1.3.2.min.js'></script>
    <script type='text/javascript' src='order-form-js.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

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
