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
<footer>
   <nav class="container-fluid navbar navbar-expand-lg navbar-light py-2 ">
       <a class="navbar-brand" href="<%=request.getContextPath() + UrlUtils.HOME_PAGE%>">Logo</a>
       <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse" id="navbarNavDropdown">
           <ul class="navbar-nav ml-auto border-bottom ">
               <li class="nav-item active">
                   <a class="nav-link" href="<%=request.getContextPath() + UrlUtils.HOME_PAGE%>">Trang chủ
                       <span class="sr-only">(current)</span>
                   </a>
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
                   <a href="<%=request.getContextPath() + UrlUtils.CART_PAGE%>" class="nav-cart nav-link text-white bg-dark rounded-circle">
                       <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                   </a>
               </li>
           </ul>
       </div>
   </nav>
</footer>
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
                    <div class = "d-flex flex-row inner-item">
                        <div class = "align-self-start item-image">
                            <img src="/nuoc-cot-sam-day-ngoc-linh-langbiang-food-hop-6-chai-60ml.jpg" width="130px" height="130px">
                        </div>

                        <div class = "d-flex flex-row  item-content">

                            <div class = "item-content-des text-justify mx-4 pr-2" style="width: 60%;">

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

                            <div class = "d-flex justify-content-around align-self-start item-content-details" style="width: 40%;">
                                <div class = "justify-content-start mr-4 item-content-details-price" >
                                    <p class = "mb-2">${product.getPrice()} $</p>
                                    <p class = "mb-0"><del>${product.getPrice()}$</del><span class = "ml-3">|-20%</span></p>
                                </div>
                                <div class = "d-flex justify-content-end align-items-center item-content-details-quantity">
                                    <a href = "<%=request.getContextPath() + UrlUtils.PRODUCT_ADD%>?productID=${product.getProductID()}" class = "btn btn-sm btn-outline-secondary"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                    <span class ="border border-secondary rounded p-1" style="width: 60px; text-align: center; height: 30px;">${product.getQuantity()} kg</span>
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
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>