<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
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
<title>Approved Grooved</title>
	<%
        String firstname = (String) session.getAttribute("firstname");
        String lastname =  (String) session.getAttribute("lastname");
        String position = (String) session.getAttribute("position");
    %>
</head>
<body>
<nav class="__nav navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="container px-5">
        <a class="navbar-brand" href="index.jsp">Fitwel Industries</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Product</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ThrededFitting.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="GroovedFittings">Grooved Fittings</a></li>
                        <li><a class="dropdown-item" id="addproduct" href="AddProduct.jsp">Add Product</a>
                    </ul>
                </li>
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Order</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="OrderThreded.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="OrderGrooved.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Invoice</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="#">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="#">Grooved Fittings</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">Approval</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="ApproveThreded.jsp">Threded Fittings</a></li>
                        <li><a class="dropdown-item" href="ApproveGrooved.jsp">Grooved Fittings</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Pending</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><%= firstname %> <%= lastname %></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <li><a class="dropdown-item" href="dashboard.jsp#youraccount">Your Account</a></li>
                        <li><a class="dropdown-item"  href="#">Reset Password</a></li>
                        <li><a class="dropdown-item" href="#">Employee Details</a></li>
                        <li><a class="dropdown-item" href="#">Log Out</a>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<footer class="bg-dark py-4 mt-5">

    <div class="container px-4 mt-auto">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="big m-0 text-white ">Address :</div>
                <div class="big m-0 text-white">Fitwel Industries
                    SF 535/7, Kollupalayam, </div>
                <div class="big m-0 text-white">
                    Near Kaniyur Toll Gate,
                    Coimbatore-641659, Tamil Nadu, India</div>
            </div>

            <div class="col-auto">
                <div class="big m-0 text-white">Gmail : fitwelindustries@gmail.com</div>
                <div class="big m-0 text-white">Phone : +91 90000 00000</div>
            </div>

            <div class="col-auto">
                <div class="big m-0 text-white">“Copyright © Fitwel Industries."</div>
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
</body>
</html>