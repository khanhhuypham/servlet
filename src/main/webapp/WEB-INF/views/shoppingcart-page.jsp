<%@ page import="util.UrlUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html lang="en">
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<header class = "bg-white">
    <div>
        <nav class="container-fluid navbar navbar-expand-lg navbar-light  py-2">
            <a class="navbar-brand" style = "font-size: 40px;" href="<%=request.getContextPath() + UrlUtils.HOME_PAGE%>"><i class="fa fa-product-hunt mr-3" aria-hidden="true"></i></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto border-bottom ">
                    <li class="nav-item active">
                        <a class="nav-link" href="<%=request.getContextPath() + UrlUtils.HOME_PAGE%>">Trang chủ <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Sản phẩm
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Giới thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                    <li class="nav-item">
                        <a href="<%=request.getContextPath() + UrlUtils.CART_PAGE%>" style = "width: 110px;"
                            class="nav-cart nav-link text-white bg-info rounded d-flex justify-content-around align-items-center">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i><span>giỏ hàng</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<main class = "container-fluid bg-light">
    <h2 class = "text-dark">Giỏ hàng <span class = "text-secondary">(${sizeOfProductList} sản phẩm)</span></h2>
    <div class = "row mt-3">
        <div class = "container inner-cart col-lg-9 col-12">
        <c:forEach var = "product" varStatus = "loopStatus" items = "${products}">
            <div class = "inner-products-cart bg-white p-4 mb-5">
                <div class = "item bg-white">
                    <a class = "mb-3">
                        <span class = "text-dark font-weight-bold">Tên của hàng</span>
                    </a>
                    <div class = "d-flex flex-column flex-lg-row justify-content-lg-between mt-4">
                        <div class = "d-flex justify-content-start mb-4">
                            <img src="<c:url value = "/assets/logo.png"/>" height="auto" width = "100%">
                            <div class = "text-justify mx-4 pr-2">
                                <a class = "d-block">
                                    <span>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                    Earum perspiciatis laboriosam modi incidunt, doloremque maiores
                                    qui quis illo et excepturi delectus fugiat, ex ut ducimus explicabo
                                    temporibus tempora neque repellendus dicta magnam harum sapiente praesentium!
                                    Perferendis eum harum accusantium explicabo. Minus ab distinctio doloribus quis
                                    aut? Accusamus libero omnis pariatur.
                                    </span>
                                </a>
                                <a class = "btn btn-sm btn-outline-danger text-danger mt-3" href = "<%=request.getContextPath() + UrlUtils.PRODUCT_DELETE%>?productID=${product.getProductID()}">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </a>
                        
                            </div>
                        </div>

                        <div class = "d-flex flex-column  flex-lg-row item-content">

                            <div class = "d-flex justify-content-around align-self-start m-4 item-content-details">
                                <div class = "justify-content-start mr-4 item-content-details-price" >
                                    <p class = "mb-2">10 $</p>
                                    <p class = "mb-0"><del>20$</del><span class = "ml-3">|-20%</span></p>
                                </div>
                                <div class = "d-flex justify-content-end align-items-center item-content-details-quantity">
                                    <a href = "<%=request.getContextPath() + UrlUtils.PRODUCT_ADD%>?productID=${product.getProductID()}" class = "btn btn-sm btn-outline-secondary"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                    <span class ="border border-secondary rounded p-1 form-control" style="width: 80px; text-align: center; height: 30px;">20 kg</span>
                                    <a href = "<%=request.getContextPath() + UrlUtils.PRODUCT_REMOVE%>?productID=${product.getProductID()}" class = "btn btn-sm btn-outline-secondary"><i class="fa fa-minus" aria-hidden="true"></i></a>      
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>         
        </div>
        
        <div class = "total-price col-lg-3 col-12">
            <div>
                <div class = "d-flex flex-column cart-coupon bg-white p-3 mb-4">
                    <div class = "d-flex flex-row justify-content-between mb-3">
                        <p class = "text-dark font-weight-bold mb-0">khuyến mãi từ Shop</p>
                        <p class = "text-secondary mb-0">có thể chọn 2<span><i class="fa fa-info-circle ml-1" aria-hidden="true"></i></span></p>
                    </div>
                    <div class = "text-primary">
                        <span class = "mr-2"><i class="fa fa-money" aria-hidden="true"></i></span>
                        <span>chọn và nhập khuyến mãi</span>
                    </div>
                </div>

                <div class = "cart-bill mb-4 bg-white p-3">
                    <ul class = "price-item p-0">
                        <li class = "d-flex justify-content-between mb-2"><span class = "text-secondary">Tạm tính</span><span>${totalBill} $</span></li>
                        <li class = "d-flex justify-content-between"><span class = "text-secondary">Giảm giá</span><span>Số tiền</span></li>
                    </ul>
                    <hr>
                    <div class = "d-flex justify-content-between"><span class = "text-secondary">Tổng cộng</span><span>${totalBill} $</span></div>
                </div>

                <a class = "btn btn-danger text-white">Tiến hành đặt hàng</a>
            </div>
        </div>

    </div>
</main>

<footer class = "text-center text-lg-start bg-white">
    <!-- section: social media -->
    <section class = "container d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
        <div class = "me-5 d-none d-lg-block"><span>Get connected with us on social networks</span></div>
        <div class = "text-muted">
            <a><i class="fa fa-facebook-official" aria-hidden="true"></i></a>
            <a href = ""><i class="fa fa-twitter text-muted" aria-hidden="true"></i></a>
            <a><i class="fa fa-google" aria-hidden="true"></i></a>
            <a><i class="fa fa-instagram" aria-hidden="true"></i></a>
            <a><i class="fa fa-linkedin" aria-hidden="true"></i></a>
            <a><i class="fa fa-github-alt" aria-hidden="true"></i></a>
        </div>
    </section>
    <!-- section: social media -->

    <!-- Section: Links  -->
    <section>
        <div class = "container text-left text-md-start mt-5">
            <!-- Grid row -->
            <div class = "row">
                <!-- Grid column -->
                <div class = "col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- content -->
                    <h6><i class="fa fa-product-hunt mr-3" aria-hidden="true"></i>Company name</h6>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Molestias cum excepturi debitis eius facere repudiandae optio provident dolorem ex doloribus!
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class = "col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Products
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Angular</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">React</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Vue</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Laravel</a>
                    </p>
                </div>
                <!-- Grid column -->
                 <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                        Useful links
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Pricing</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Settings</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Orders</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Help</a>
                    </p>
                </div>
                <!-- Grid column -->
  
                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold mb-4">
                    Contact
                    </h6>
                    <p><i class="fa fa-home" aria-hidden="true"></i> New York, NY 10012, US</p>
                    <p>
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                    info@example.com
                    </p>
                    <p><i class="fa fa-phone" aria-hidden="true"></i> + 01 234 567 88</p>
                    <p><i class="fa fa-fax" aria-hidden="true"></i> + 01 234 567 89</p>
                </div>
                <!-- Grid column -->
            </div>
        <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
        © 2021 Copyright:
        <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>