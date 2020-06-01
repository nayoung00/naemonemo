<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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