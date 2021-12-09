<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Fitwel Industries</title>
</head>

<body>

    <!-- Navbar -->
    <nav class="__nav navbar navbar-expand-md navbar-dark bg-dark sticky-top">
        <div class="container px-5">
            <a class="navbar-brand" href="index.jsp">Fitwel Industries</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.jsp#about">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">Product</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                            <li><a class="dropdown-item" href="index.jsp#Grooved">Grooved Fittings</a></li>
                            <li><a class="dropdown-item" href="index.jsp#Threded">Threded Fittings</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="index.jsp#gallery">Gallery</a></li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">Register</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                            <li><a class="dropdown-item" href="index.jsp#log">Log-In</a></li>
                            <li>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-default" data-bs-toggle="modal" data-bs-target="#modalRegister">
                                    Sign Up
                                </button>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
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
                    <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!--first Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="first-name" name="first-name" type="text" required>
                                <label for="first-name">First name</label>
                                
                            </div>
                            <!-- last name input -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="last-name" name="last-name" type="text"  required>
                                <label for="last-name">last name</label>
                                
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" name="email" type="email" p required>
                                <label for="email">Email address</label>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" name="phone" type="tel"  required>
                                <label for="phone">Phone number</label>
                               
                            </div>
                            <!-- Address input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="address" name="address" type="text" style="height: 10rem" required></textarea>
                                <label for="address">Address</label>
                                
                            </div>
							 <!-- Submit Button-->
                            <div class="d-grid">
                                <input class="btn btn-primary btn-lg" id="submitButton" type="submit" value="Sign Up">
                            </div>
                         </form>
                        
                </div>
                <div class="modal-footer">
                    <div class="text-center mt-3">Have an account? <a href="index.jsp#log">log in</a></div>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal End -- >

    <!-- Hero Banner -->
    <header class="bg-dark py-5">
        <div class="container px-5" id="info">
            <div class="row gx-5 align-items-center justify-content-center" >
                <div class="col-lg-8 col-xl-7 col-xxl-6">
                    <div class="my-5 text-center text-xl-start">
                        <h1 class="bgdark display-5 fw-bolder text-white mb-2">Fitwel Industries</h1>
                        <p class="lead fw-normal text-white-50 mb-4">Fitwel industries delivers a variety of SPM
                            Machineries, Stainless Steel – Cast Iron – SG Iron -Threaded Fittings and Pipe Nipples.
                        </p>
                        <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                            <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#about">Get Started</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5"
                        src="xb.jpg" alt="Info Image"></div>
            </div>
        </div>
    </header>

    <!-- About -->
    <section class="py-5 bg-light" id="about" data-aos="zoom-in" data-aos-duration="2000">
        <div class="container px-5 my-5">
            <div class="row gx-5 align-items-center">
                <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0"
                        src="https://dummyimage.com/600x400/343a40/6c757d" alt="..."></div>
                <div class="col-lg-6">
                    <h2 class="fw-bolder">Our founding</h2>
                    <p class="lead fw-normal text-muted mb-0">Fitwel Industries, An ISO 9001 certified company. A
                        quality manufacturer, exporter and a supplier of Stainless steel, Cast Iron, G I Pipe Fittings &
                        Pipe Nipples, SPM machineries, CNC Machined Components & Concrete Test Cube Moulds.
                        Fitwel industries delivers a variety of SPM Machineries, Stainless Steel – Cast Iron – SG Iron
                        -Threaded Fittings and Pipe Nipples.<br><br>
                        The products delivered by Fitwel stands for its World-class quality and cost effectiveness.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5" data-aos="zoom-in" data-aos-duration="2000">
        <div class="container px-5 my-5">
            <div class="row gx-5 align-items-center">
                <div class="col-lg-6 order-first order-lg-last"><img class="img-fluid rounded mb-5 mb-lg-0"
                        src="growth-agencies.jpg" alt="..."></div>
                <div class="col-lg-6">
                    <h2 class="fw-bolder">Growth &amp; beyond</h2>
                    <p class="lead fw-normal text-muted mb-0">Lorem ipsum dolor sit amet consectetur adipisicing
                        elit. Iusto est, ut esse a labore aliquam beatae expedita. Blanditiis impedit numquam libero
                        molestiae et fugit cupiditate, quibusdam expedita, maiores eaque quisquam.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Team -->
    <section class="py-5 bg-light">
        <div class="container px-5 my-5">
            <div class="text-center" data-aos="flip-left" data-aos-duration="2000">
                <h2 class="fw-bolder">Our team</h2>
                <p class="lead fw-normal text-muted mb-5">Dedicated to quality and your success</p>
            </div>
            <div class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center" data-aos="zoom-in" data-aos-duration="2000">
                <div class="col mb-5 mb-5 mb-xl-0">
                    <div class="text-center">
                        <img class="img-fluid rounded-circle mb-4 px-4"
                            src="https://dummyimage.com/150x150/ced4da/6c757d" alt="...">
                        <h5 class="fw-bolder">Ibbie Eckart</h5>
                        <div class="fst-italic text-muted">Founder &amp; CEO</div>
                    </div>
                </div>
                <div class="col mb-5 mb-5 mb-xl-0">
                    <div class="text-center">
                        <img class="img-fluid rounded-circle mb-4 px-4"
                            src="https://dummyimage.com/150x150/ced4da/6c757d" alt="...">
                        <h5 class="fw-bolder">Arden Vasek</h5>
                        <div class="fst-italic text-muted">CFO</div>
                    </div>
                </div>
                <div class="col mb-5 mb-5 mb-sm-0">
                    <div class="text-center">
                        <img class="img-fluid rounded-circle mb-4 px-4"
                            src="https://dummyimage.com/150x150/ced4da/6c757d" alt="...">
                        <h5 class="fw-bolder">Toribio Nerthus</h5>
                        <div class="fst-italic text-muted">Operations Manager</div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="text-center">
                        <img class="img-fluid rounded-circle mb-4 px-4"
                            src="https://dummyimage.com/150x150/ced4da/6c757d" alt="...">
                        <h5 class="fw-bolder">Malvina Cilla</h5>
                        <div class="fst-italic text-muted">CTO</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Products -->
    <h2 class="pro mt-5" ><b><u>PRODUCT</u></b></h2>

    <!-- Grooved -->
    <section class="py-5" id="Grooved" data-aos="fade-right" data-aos-offset="300" data-aos-duration="2000">
        <div class="container px-5">
            <h1 class="fw-bolder fs-5 mb-4"><u>Grooved Fittings</u></h1>
            <div class="row gx-5">
                <div class="col-lg-4 mb-5">
                    <div class="card h-100 shadow border-0">
                        <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="...">
                        <div class="card-body p-4">
                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                            <a class="text-decoration-none link-dark stretched-link btn btn-default" data-bs-toggle="modal" data-bs-target="#modalGrooved">
                                <div class="h5 card-title mb-3">Blog post title</div>
                            </a>
                            <p class="card-text mb-0">Some quick example text to build on the card title and make up the
                                bulk of the card's content.</p>
                        </div>
                        <!-- <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                            <div class="d-flex align-items-end justify-content-between">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d"
                                        alt="...">
                                    <div class="small">
                                        <div class="fw-bold">Kelly Rowan</div>
                                        <div class="text-muted">March 12, 2021 · 6 min read</div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-4 mb-5">
                    <div class="card h-100 shadow border-0">
                        <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="...">
                        <div class="card-body p-4">
                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                            <a class="text-decoration-none link-dark stretched-link btn btn-default" data-bs-toggle="modal" data-bs-target="#modalGrooved">
                                <div class="h5 card-title mb-3">Another blog post title</div>
                            </a>
                            <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of
                                each card. Some quick example text to build on the card title and make up the bulk of
                                the card's content.</p>
                        </div>
                        <!-- <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                            <div class="d-flex align-items-end justify-content-between">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d"
                                        alt="...">
                                    <div class="small">
                                        <div class="fw-bold">Josiah Barclay</div>
                                        <div class="text-muted">March 23, 2021 · 4 min read</div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-4 mb-5">
                    <div class="card h-100 shadow border-0">
                        <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="...">
                        <div class="card-body p-4">
                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                            <a class="text-decoration-none link-dark stretched-link btn btn-default" data-bs-toggle="modal" data-bs-target="#modalGrooved">
                                <div class="h5 card-title mb-3">The last blog post title is a little bit longer than the
                                    others</div>
                            </a>
                            <p class="card-text mb-0">Some more quick example text to build on the card title and make
                                up the bulk of the card's content.</p>
                        </div>
                        <!-- <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                            <div class="d-flex align-items-end justify-content-between">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d"
                                        alt="...">
                                    <div class="small">
                                        <div class="fw-bold">Evelyn Martinez</div>
                                        <div class="text-muted">April 2, 2021 · 10 min read</div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- Modal Grooved Fittings -->
    <div class="modal fade" id="modalGrooved" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Grroved Fittings</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        .ozovhossdojfsdiun
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal Grooved End Here -->
    <!-- Threded -->
    <section class="py-5" id="Threded" data-aos="fade-right" data-aos-offset="300" data-aos-duration="2000">
        <div class="container px-5">
            <h1 class="fw-bolder fs-5 mb-4"><u>Threded Fittings</u></h1>
            <div class="row gx-5">
                <div class="col-lg-4 mb-5">
                    <div class="card h-100 shadow border-0">
                        <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="...">
                        <div class="card-body p-4">
                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                           <a class="text-decoration-none link-dark stretched-link btn btn-default" data-bs-toggle="modal" data-bs-target="#modalThreaded">
                                <div class="h5 card-title mb-3">Blog post title</div>
                            </a>
                            <p class="card-text mb-0">Some quick example text to build on the card title and make up the
                                bulk of the card's content.</p>
                        </div>
                        <!-- <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                            <div class="d-flex align-items-end justify-content-between">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d"
                                        alt="...">
                                    <div class="small">
                                        <div class="fw-bold">Kelly Rowan</div>
                                        <div class="text-muted">March 12, 2021 · 6 min read</div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-4 mb-5">
                    <div class="card h-100 shadow border-0">
                        <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="...">
                        <div class="card-body p-4">
                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                            <a class="text-decoration-none link-dark stretched-link btn btn-default" data-bs-toggle="modal" data-bs-target="#modalThreaded">
                                <div class="h5 card-title mb-3">Another blog post title</div>
                            </a>
                            <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of
                                each card. Some quick example text to build on the card title and make up the bulk of
                                the card's content.</p>
                        </div>
                        <!-- <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                            <div class="d-flex align-items-end justify-content-between">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d"
                                        alt="...">
                                    <div class="small">
                                        <div class="fw-bold">Josiah Barclay</div>
                                        <div class="text-muted">March 23, 2021 · 4 min read</div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-4 mb-5">
                    <div class="card h-100 shadow border-0">
                        <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="...">
                        <div class="card-body p-4">
                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                             <a class="text-decoration-none link-dark stretched-link btn btn-default" data-bs-toggle="modal" data-bs-target="#modalThreaded">
                                <div class="h5 card-title mb-3">The last blog post title is a little bit longer than the
                                    others</div>
                            </a>
                            <p class="card-text mb-0">Some more quick example text to build on the card title and make
                                up the bulk of the card's content.</p>
                        </div>
                        <!-- <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                            <div class="d-flex align-items-end justify-content-between">
                                <div class="d-flex align-items-center">
                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d"
                                        alt="...">
                                    <div class="small">
                                        <div class="fw-bold">Evelyn Martinez</div>
                                        <div class="text-muted">April 2, 2021 · 10 min read</div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Modal Threaded Start -->
     <div class="modal fade" id="modalThreaded" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Threaded Fittings</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        idufhliwafbhirkf
        sdfSKUDhflksdfj
        sdlfhskud
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

    <!-- Our Work -->
    <section class="py-5" id="gallery" data-aos="zoom-in" data-aos-duration="2000">
        <div class="container px-5 my-5">
            <div class="text-center mb-5">
                <h1 class="fw-bolder">Gallery</h1>
                <p class="lead fw-normal text-muted mb-0 ">Company portfolio</p>
            </div>
            <div class="row gx-5">
                <div class="col-lg-6">
                    <div class="position-relative mb-5">
                        <!-- <a class="btn btn-default" data-bs-toggle="modal" data-bs-target="#modalGallery1"> -->
                            <img class="img-fluid rounded-3 mb-3" src="STAINLESS-STEEL-FIT-2.jpg" alt="Gallery Image">
                        <!-- </a> -->
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="position-relative mb-5">
                        <!-- <a class="btn btn-default" data-bs-toggle="modal" data-bs-target="#modalGallery2"> -->
                        <img class="img-fluid rounded-3 mb-3" src="krytox-ts4-thread-sealant-1.jpg" alt="Gallery Image">
                    <!-- </a> -->
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="position-relative mb-5 mb-lg-0">
                        <img class="img-fluid rounded-3 mb-3" src="201672210134864317.jpg" alt="Gallery Image">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="position-relative">
                        <img class="img-fluid rounded-3 mb-3" src="5-150-3M-FITTINGS.jpg" alt="Gallery Image">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- modal Gallery 1 -->
  <!--   <div class="modal fade" id="modalGallery1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img class="img-fluid rounded-3 mb-3" src="STAINLESS-STEEL-FIT-2.jpg" alt="Gallery Image">
      </div>
      <div class="modal-footer">
          <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalGallery2">next</button>
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> -->
<!-- modal gallery 1 end here -->

 <!-- modal Gallery 2 -->
   <!--  <div class="modal fade" id="modalGallery2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <img class="img-fluid rounded-3 mb-3" src="krytox-ts4-thread-sealant-1.jpg" alt="Gallery Image">
      </div>
      <div class="modal-footer">
          <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalGallery3">next</button>
          <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalGallery1">Back</button>
      </div>
    </div>
  </div>
</div> -->
<!-- modal gallery 2 end here -->

    <!-- Login -->
    <hr class="dropdown-divider">
    <section class="py-5" id="log" data-aos="zoom-in" data-aos-duration="2000">
        <div class="container px-5">
            <!-- Contact form-->
            <div class="bg-dark rounded-3 py-5 px-4 px-md-5 mb-5">
                <div class="text-center mb-5">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i>
                    </div>
                    <h1 class="fw-bolder color">Log-In</h1>
                    <p class="lead fw-normal text-muted mb-0">We'd love to hear from you</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6">
                        <form id="contactForm" method="post" action="Login">
                            <!-- Username input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="username" name="username" type="text" required>
                                <label for="username">Username</label>
                            </div>
                            <!-- Password input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="password" name="password" type="password" required>
                                <label for="password">Password</label>
                                
                            </div>
                            <!-- Submit Button-->
                            <div class="d-grid">
                                <button class="btn btn-primary btn-lg" id="submitButton"type="submit">
                                    Login
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="container text-center">
                        <a class="btn btn-primary  my-3" href="forgetpassword.jsp">
                           Forget Password
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

   
      <!-- Footer -->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
    <div class ="map" >
        <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d62653.60247627951!2d77.07063779521357!3d11.049859186796562!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sSF%20535%2F7%2C%20Kollupalayam%2C%20Near%20Kaniyur%20Toll%20Gate%2C%20Coimbatore-641659%2C%20Tamil%20Nadu%2C%20India!5e0!3m2!1sen!2sin!4v1635703290514!5m2!1sen!2sin"
            width="1500" height="450" frameborder="0" style="border:0;" allowfullscreen="yes" aria-hidden="false" tabindex="0"> </iframe>
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
                <div class="big m-0 text-white">Gmail :  fitwelindustries@gmail.com</div>
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
</body>

</html>