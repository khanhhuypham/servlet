<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "util.UrlUtils" %>
<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Trang chủ</title>
    <link rel = "stylesheet" href = "/assets/home-page.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
  <footer>
    <nav class="container-fluid navbar navbar-expand-lg navbar-light bg-light py-2">
      <a class="navbar-brand" href="<%=request.getContextPath() + UrlUtils.HOME_PAGE%>">Logo</a>
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
            <a href="<%=request.getContextPath() + UrlUtils.CART_PAGE%>" class="nav-cart nav-link text-white bg-dark rounded-circle">
            	<i class="fa fa-shopping-cart" aria-hidden="true"></i>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </footer>
  <main>

  <div  class= "container-fluid p-4 mt-5 border-bottom bg-light">
    <h2>Sản phẩm</h2>
    <div class = "row">
    <c:forEach var = "product" varStatus = "loopStatus" items = "${products}">
      <div class = "col-sm-6 col-md-4 col-lg-3 text-center border p-4 mb-4 bg-white">
        <div class = "item-img">
          <a href = "\">  
            <img src = "/webapp/assets/nuoc-cot-sam-day-ngoc-linh-langbiang-food-hop-6-chai-60ml.jpg" alt = "Product Description">  
          </a>
          <div class = "overlay">
            <div class = "wrap">
	             <span>
	              <a href = "<%= request.getContextPath() + UrlUtils.DETAIL_PAGE%>"
	               class = "p-1 border border-warning rounded w-100">chi tiet</a>
	             </span>
              <span>
	              <a href = "<%= request.getContextPath() + UrlUtils.CART_PAGE%>?productID=${product.productID}"
	               class = "p-1 border border-warning rounded w-100" >
           				<i class="fa fa-shopping-cart" aria-hidden="true"></i>
	              </a>
              </span>
            </div>
          </div>
        </div>

        <div class = " item-info font-weight-bold ">
          <a class = "text-dark">${product.productName}</a>
          <p class = "text-danger">${product.getPrice()} $</p>
        </div>
      </div>
     </c:forEach>
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