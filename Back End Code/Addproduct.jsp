<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">
   

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Add Product</title>
    <%
        String firstname = (String) session.getAttribute("firstname");
        String lastname =  (String) session.getAttribute("lastname");
    
    %>
</head>
<body>
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
<section class="pb-3 toppadding" id="log" data-aos="zoom-in" data-aos-duration="2000">
    <div class="container px-5">
        <!-- Contact form-->
        <div class="color rounded-3 py-5 px-4 px-md-5 mb-5 effect1">
            <div class="text-center mb-5">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i>
                </div>
                <h1 class="fw-bolder">Add Products</h1>
            </div>
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-8 col-xl-6">
                    <form id="contactForm" action="ProductRegister" method="post">
                        <!-- Product Name input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="productname" name="productname" type="text" required>
                            <label for="productname">Product Name</label>
                        </div>
                        <!-- Product Size input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="productsize" name="productsize" type="text"  required>
                            <label for="productsize">Product Size</label>
                        </div>
                       
                        <div class="form-floating mb-3">
                            <input class="form-control" id="productunitprice" name="productunitprice" type="number" required>
                            <label for="productquantity">Product Unit Price</label>
                        </div>
                        <div class="mb-3">
                            <select name="fitting" id="fitting" class="form-control">
                                <option value="">Select a Category</option>
                                <option value="Threded Fitting">Threded Fitting</option>
                                <option value="Grooved Fitting">Grooved Fitting</option>
                            </select>
                        </div>
                        <!-- Submit Button-->
                        <div class="d-grid">
                            <button class="btn btn-outline-info btn-lg" id="submitButton" type="submit">
                                Add Product
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  logout model -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="removeItem()">Yes</button>
            </div>
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
                <div class="big m-0">“Copyright © Fitwel Industries."</div>
            </div>
        </div>
    </div>
</footer>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>