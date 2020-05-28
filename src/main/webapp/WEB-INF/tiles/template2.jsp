<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>

<head>
<meta charset='UTF-8'>
<!-- 파비콘생기면 넣는 곳 -->
<link rel="icon" type="image/png" href="images/favicon.ico">

<!-- 디바이스셋팅 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- 새로고침 -->
<c:if test="${not empty refreshUrl}">
<meta http-equiv="Refresh" content="${refreshUrl}">
</c:if>

<!-- 웹사이트 탭 제목 -->
<title>네모내모</title>

<!-- For favicon png <link rel="shortcut icon" type="image/icon" href="/logo/#"/> 파비콘 파일이아직없음-->

<!--font-awesome.min.css-->
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/font-awesome.min.css" />

<!--linear icon css-->
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/linearicons.css" />

<!--animate.css-->
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/animate.css" />

<!--owl.carousel.css -->
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/owl.carousel.min.css" />
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/owl.theme.default.min.css" />

<!--bootstrap.min.css-->
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/bootstrap.min.css" />

<!-- bootsnav -->
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/bootsnav.css" />

<!--style.css-->
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/style.css" />

<!--responsive.css-->
<link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/css/responsive.css" />

<!-- Include all js compiled plugins (below), or include individual files as needed -->

<script src="${pageContext.servletContext.getContextPath()}/js/jquery.js"></script>

<!--modernizr.min.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

<!--bootstrap.min.js-->
<script src="${pageContext.servletContext.getContextPath()}/js/bootstrap.min.js"></script>

<!-- bootsnav js -->
<script src="${pageContext.servletContext.getContextPath()}/js/bootsnav.js"></script>

<!--owl.carousel.js-->
<script src="${pageContext.servletContext.getContextPath()}/js/owl.carousel.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

<!--Custom JS-->
<script src="${pageContext.servletContext.getContextPath()}/js/custom.js"></script>

</head>

<body>

<!--Welcome-hero start -->
    <header id="home" class="Welcome-hero">
      <!-- top-area Start -->
      <div class="top-area">
        <div class="header-area">
          <!-- Start Navigation -->
          <nav
            class="navbar navbar-default bootsnav navbar-sticky"
            data-minus-value-desktop="70"
            data-minus-value-mobile="55"
            data-speed="1000"
          >
            <div class="container">
              <!-- Start Atribute Navigation -->
              <div class="attr-nav">
                <ul>
                  <li class="dropdown">
                    <a href="#app/alarm" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-bell"></i>
                      <!-- <span class="lnr lnr-alarm"></span> -->
                      <span class="badge badge-bg-1">3</span>
                    </a>
                    <ul class="dropdown-menu cart-list s-cate">
                      <li class="single-cart-list">
                        <a href="#" class="photo"
                          ><img src="${pageContext.servletContext.getContextPath()}/images/collection/arrivals1.jpg" class="cart-thumb" alt="image"
                        /></a>
                        <div class="cart-list-txt">
                          <h6><a href="#">알림1</a></h6>
                        </div>
                        <!--/.cart-list-txt-->
                        <div class="cart-close">
                          <span class="lnr lnr-cross"></span>
                        </div>
                        <!--/.cart-close-->
                      </li>
                      <!--/.single-cart-list -->
                      <li class="single-cart-list">
                        <a href="#" class="photo"
                          ><img src="${pageContext.servletContext.getContextPath()}/images/collection/arrivals2.jpg" class="cart-thumb" alt="image"
                        /></a>
                        <div class="cart-list-txt">
                          <h6><a href="#">알림2</a></h6>
                        </div>
                        <!--/.cart-list-txt-->
                        <div class="cart-close">
                          <span class="lnr lnr-cross"></span>
                        </div>
                        <!--/.cart-close-->
                      </li>
                      <!--/.single-cart-list -->
                      <li class="single-cart-list">
                        <a href="#" class="photo"
                          ><img src="${pageContext.servletContext.getContextPath()}/images/collection/arrivals3.jpg" class="cart-thumb" alt="image"
                        /></a>
                        <div class="cart-list-txt">
                          <h6><a href="#">알림3</a></h6>
                        </div>
                        <!--/.cart-list-txt-->
                        <div class="cart-close">
                          <span class="lnr lnr-cross"></span>
                        </div>
                        <!--/.cart-close-->
                      </li>
                      <!--/.single-cart-list -->
                    </ul>
                  </li>
                  <!--/.dropdown(알림)-->

                  <li class="###app/message?">
                    <!--.message-->
                    <a href="#"
                      ><i class="fa fa-envelope"></i
                      ><!--<span class="lnr lnr-envelope"></span>--></a
                    >
                  </li>
                  <!--/.message-->

                  <li class="profile">
                    <!--.profile-->
                    <a href="###app/mypage?" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-user"></i
                      ><!--<span class="lnr lnr-user"></span>-->
                    </a>
                  </li>
                  <!--/.profile-->
                </ul>
              </div>
              <!--/.attr-nav-->
              <!-- End Atribute Navigation -->

              <!-- Start Header Navigation -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                  <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="${pageContext.servletContext.getContextPath()}/index.html">네모내모</a>
              </div>
              <!--/.navbar-header-->
              <!-- End Header Navigation -->

              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
                <ul class="nav navbar-nav navbar-center" data-in="fadeInDown" data-out="fadeOutUp">
                  <li><a href="${pageContext.servletContext.getContextPath()}/intro.html">intro(임시)</a></li>
                  <li><a href="${pageContext.servletContext.getContextPath()}/app/group/list">moim</a></li>
                  <li><a href="${pageContext.servletContext.getContextPath()}/app/co/list">forum</a></li>
                  <li><a href="#">contact</a></li>
                </ul>
                <!--/.nav -->
              </div>
              <!-- /.navbar-collapse -->
            </div>
            <!--/.container-->
          </nav>
          <!--/nav-->
          <!-- End Navigation -->
        </div>
        <!--/.header-area-->
        <div class="clearfix"></div>
      </div>
      <!-- /.top-area-->
      <!-- top-area End -->
    </header>
    <!--/.Welcome-hero-->
    <!--Welcome-hero end -->

    <tiles:insertAttribute name="body"/>

    <!-- footer-->
    <footer class="footer">
      <div class="container-fluid">
        <p class="copyright pull-right">
          &copy;
          <script>
            document.write(new Date().getFullYear());
          </script>
          <a href="index.html">네모내모</a>
        </p>
      </div>
    </footer>

<!-- modal폼 관련 태그들 -->
    <!-- grMember 관련 modal -->  
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="card align-middle" style="width:20rem; margin: 0 auto; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">로그인 폼</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" onSubmit="logincall();return false">
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="inputEmail" class="sr-only">Your ID</label>
        <input type="text" id="uid" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="upw" class="form-control" placeholder="Password" required><br>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 기억하기
          </label>
        </div>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button>
      </form>
      
		</div>
	</div>

	<div class="modal">
	</div>
      </div>
    </div>
  </div>
</div>

<!-- 로그인 모달 -->

</body>
</html>