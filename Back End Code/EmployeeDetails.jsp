<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<title>Employee Details</title>
<%
String firstname = (String) session.getAttribute("firstname");
String lastname =  (String) session.getAttribute("lastname");
String position = (String) session.getAttribute("position");
Dao d = new Dao();
List<UserBean> list = d.getAllUser();
%>
</head>
<body class="copybody">
<!-- Navbar -->
<%@ include file="navbar.jsp" %>

<!--Page Content-->
<div class="container-fluid mt-5 pt-2">
    <h2 class="pro"><b>Employee Details</b></h2>
</div>
<div class="scroll container-fluid mt-5">
    <table style="width: 100% !important;" class="order-table table table-striped">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email-Id</th>
                <th scope="col">Phone No.</th>
                <th scope="col">Address</th>
                <th scope="col">Username</th>
                <th scope="col">Password</th>
                <th scope="col">Position</th>
            </tr>
        </thead>
        <tbody>
            <!-- rows will generate dynamically -->
            <!-- form Tag is added for placing order -->
            
<%

		for(UserBean ub : list){

%>          
                <tr>
                    <td><%=ub.getId()%></td>
                    <td><%=ub.getFirstname()+" "+ub.getLastname()%></td>
                    <td><%=ub.getEmail()%></td>
                    <td><%=ub.getPhone()%></td>
                    <td><%=ub.getAddress()%></td>
                    <td><%=ub.getUsername()%></td>
                    <td><%=ub.getPassword()%></td>
                    <td><%=ub.getPosition()%></td>
                </tr>
            
<%
	}
%>
        </tbody>
    </table>
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