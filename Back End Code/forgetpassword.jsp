<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Forget Password</title>
    <link rel="stylesheet" type="text/css" href="style.css">

  
</head>

<body>
    <!-- Reset Password -->
    <hr class="dropdown-divider">
    <section class="py-5" id="log">
        <div class="container px-5">
            <!-- Contact form-->
            <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                <div class="text-center mb-5">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i>
                    </div>
                    <h1 class="fw-bolder">Forgot Password</h1>
                   
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6">
                        <form id="contactForm" method="post" action="ForgetPassword">

                            <!-- Username input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="username" name="username" type="text"
                                    placeholder="Enter your User Name..." required>
                                <label for="username">Username</label>
                                <div class="invalid-feedback" data-sb-feedback="username:required">A Username is required.</div>
                            </div> -->
                            
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" name='email' type="email" required>
                                <label for="email">Email address</label>
                               
                            </div>
                            <!--  Phone number input
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" name='phone' type="tel" placeholder="(123) 456-7890" required>
                                <label for="phone">Phone number</label>
                                <div class="invalid-feedback" required>A phone number is
                                    required.</div>
                            </div> -->
                            <!-- Submit Button-->
                            <div class="d-grid">
                                <input class="btn btn-primary btn-lg" id="submitButton" type="submit" value="submit">
                                
                                
                            </div>
                            
                            <div class="resetpage">
                                <button type="button" class="link_bg btn btn-default" data-bs-toggle="modal" data-bs-target="#modalRegister">
                                    Create a New Account
                                </button>
                            </div>
                            <div class="indexpage">
                                <a class="link_bg" href="index.jsp#log-in">Back to log in.</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
       <!-- Modal Sign Up Start Here-->
    <div class="modal fade" id="modalRegister" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Sign Up</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- sign Up Form  -->
                    <form id="contactForm" data-sb-form-api-token="API_TOKEN" method="SignUp">
                            <!--first Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="first-name" name="first-name" type="text" placeholder="Enter your first name..." required>
                                <label for="first-name">First name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">first name is required.</div>
                            </div>
                            <!-- last name input -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="last-name" name="last-name" type="text" placeholder="Enter your last name..." required>
                                <label for="last-name">last name</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">last name is required.</div>
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" name="email" type="email" placeholder="name@example.com" required>
                                <label for="email">Email address</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.
                                </div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" name="phone" type="tel" placeholder="(123) 456-7890" required>
                                <label for="phone">Phone number</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.
                                </div>
                            </div>
                            <!-- Address input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="address" name="address" type="text" placeholder="Enter your message here..." style="height: 10rem" required></textarea>
                                <label for="address">Address</label>
                                <div class="invalid-feedback" data-sb-feedback="address:required">A message is required.
                                </div>
                            </div>
							<!-- Submit Button-->
                            <div class="d-grid">
                                <input class="btn btn-primary btn-lg" id="submitButton" 
                                type="submit" value="Sign Up">
                            </div>
                         </form>
                        
                </div>
                <div class="modal-footer">
                    <div class="text-center mt-3">Have an account? <a href="index.jsp#log-in">log in</a></div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal End -- >
        
    </section>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
      <script>
        function myFunction() {
            document.getElementById("__register").style.display = "block";
        }
    </script>

</body>

</html>