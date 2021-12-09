<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="DAO.*,BeanClass.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Dashboard</title>
    <%
		String uname = (String) session.getAttribute("username"); 
		String pswd = (String) session.getAttribute("password");
		Dao d = new Dao();
		UserBean user = new UserBean();
		
 		user = d.getUserByLoginAndPassword(uname,pswd);
 		int id = user.getId();
		String firstname = user.getFirstname();
		String lastname = user.getLastname();
		String email = user.getEmail();
		String address = user.getAddress();
		String phone = user.getPhone();
		String position = user.getPosition();
		String username = user.getUsername();
		String password = user.getPassword();
		session.setAttribute("firstname", firstname);
		session.setAttribute("lastname",lastname);
		System.out.println(position);
		
		
 %>
</head>
<body>
<!-- Navbar -->
<nav class="__nav navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="container px-5">
        <a class="navbar-brand" href="index.html">Fitwel Industries</a>
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
                        <li><a class="dropdown-item" href="#">Grooved Fittings</a></li>
                        <li><a class="dropdown-item" id="addproduct" href="#">Add Product</a>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Invoice</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Comparison</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Pending</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><%= firstname %> <%= lastname %></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <li><a class="dropdown-item" href="dashboard.jsp#youraccount">Your Account</a></li>
                        <li><a class="dropdown-item"  href="#">Reset Password</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class=" container py-5 bg-light mt-4" id="youraccount">
	<form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!--first Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="first-name" name="first-name" type="text" value="<%= firstname %>"required>
                                <label for="first-name">First name</label>
                                
                            </div>
                            <!-- last name input -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="last-name" name="last-name" type="text" value="<%= lastname %>"required>
                                <label for="last-name">last name</label>
                                
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" name="email" type="email" value="<%= email %>" required>
                                <label for="email">Email address</label>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" name="phone" type="tel" value="<%= phone %>" required>
                                <label for="phone">Phone number</label>
                               
                            </div>
                            <!-- Address input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="address" name="address" style="height: 10rem" required><%= address %></textarea>
                                <label for="address">Address</label>
                                
                            </div>
                            <!-- Username  input-->
                            <!-- <div class="form-floating mb-3">
                                <input class="form-control" id="username" name="username" type="text" value=""  required>
                                <label for="phone">Login Id</label>
                               
                            </div>
                             -->
                            <!-- Password input-->
                            <!--   <div class="form-floating mb-3">
                                <input class="form-control" id="password" name="password" type="text" value="" required>
                                <label for="phone">Password</label>
                               
                            </div>
                            -->
							 <!-- Submit Button-->
                            <div class="d-grid">
                                <input class="btn btn-primary btn-lg" id="submitButton" type="submit" value="Update Details">
                            </div>
                            
                         </form>
</div>
<!-- Footer -->
<footer class="bg-dark py-4 mt-5">
    <div class="container px-5">
        <div class="map">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d62653.60247627951!2d77.07063779521357!3d11.049859186796562!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sSF%20535%2F7%2C%20Kollupalayam%2C%20Near%20Kaniyur%20Toll%20Gate%2C%20Coimbatore-641659%2C%20Tamil%20Nadu%2C%20India!5e0!3m2!1sen!2sin!4v1635703290514!5m2!1sen!2sin"
                width="1500" height="450" frameborder="0" style="border:0;" allowfullscreen="yes" aria-hidden="false"
                tabindex="0"> </iframe>
        </div>
    </div>

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
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
<!-- check if user is admin or not if it's admin then show add product -->
<!-- <% 
if(position != "Admin"){
%>
<script type="text/javascript">
	document.getElementById("addproduct").disabled="true";
	
</script>
<%} %> -->
</body>
</html>