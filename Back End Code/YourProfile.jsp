<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!doctype html>
<html>



<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Your Profile</title>
    <%
    String firstname = (String) session.getAttribute("firstname");
	String lastname =  (String) session.getAttribute("lastname");
    String position = (String) session.getAttribute("position");
    int user_id = (Integer) session.getAttribute("userid");
    %>
</head>

<body class="copybody">
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


<%
String dbUrl = "jdbc:mysql://localhost:3306/ims";
String dbUname = "root";
String dbPassword = "root";
String dbDriver = "com.mysql.cj.jdbc.Driver"; 
String query = "select * from `ims`.`user` where `user_id`="+user_id;

try
{
Class.forName(dbDriver);
Connection con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(query);
if(rs.next()){
%>

<!--your profile-->
<div class="container-fluid pt-3">
    <h1 class="pro fw-bolder">Your Profile</h1>
</div>
<div class="container shadow-lg rounded mt-5 mb-5 color">
    <div class="card-body">
        <div class="row">
            <div class="col-sm-3">
                <h6 class="mb-0">Full Name</h6>
            </div>
            <div class="col-sm-9 text-secondary">
                <%=rs.getString("user_firstname")+" "+rs.getString("user_lastname")%>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-sm-3">
                <h6 class="mb-0">E-mail</h6>
            </div>
            <div class="col-sm-9 text-secondary">
                <%=rs.getString("user_email")%>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-sm-3">
                <h6 class="mb-0">Mobile</h6> 
            </div>
            <div class="col-sm-9 text-secondary">
                <%=rs.getString("user_phoneno")%>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-sm-3">
                <h6 class="mb-0">Address</h6>
            </div>
            <div class="col-sm-9 text-secondary">
                <%=rs.getString("user_address")%>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-sm-3">
                <h6 class="mb-0">Position</h6>
            </div>
            <div class="col-sm-9 text-secondary">
                <%=rs.getString("user_position")%>
            </div>
        </div>
    </div>
</div>
<%
}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<!-- Footer -->
<hr class="dropdown-divider">
<footer class="pt-4 mb-3 mt-2">

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
<!-- for valdation if employee login then these both fields are none -->
<%
if(position.equals("Employee")){
%>
<script>
document.getElementById("addproduct").style.display = "none";
document.getElementById("employeedetail").style.display = "none";
</script> 
<%}%> 
</body>

</html>