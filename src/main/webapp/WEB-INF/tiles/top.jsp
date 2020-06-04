<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--Welcome-hero start -->
<header id="home" class="Welcome-hero">
		<!-- top-area Start -->
		<div class="top-area">
				<div class="header-area">
						<!-- Start Navigation -->
						<nav class="navbar navbar-default bootsnav navbar-sticky"
								data-minus-value-desktop="70" data-minus-value-mobile="55"
								data-speed="1000">
								<div class="container">
										<div class="attr-nav">
												<ul>
														<li class="profile"><c:if
																		test="${not empty loginUser}">
																		<a href='../auth/logout'>Logout</a>
																		<li><a href='../member/mypage'>Mypage</a></li>
																</c:if> <c:if test="${empty loginUser}">
																		<a href='../auth/login'>Login</a>
																</c:if></li>
												</ul>
										</div>


										<div class="navbar-header">
												<button type="button" class="navbar-toggle"
														data-toggle="collapse" data-target="#navbar-menu">
														<i class="fa fa-bars"></i>
												</button>
												<div class="logo" style="margin: 0px;">
														<a href="${pageContext.request.getContextPath()}/index.html" class="navbar-brand"> <img
																src="${pageContext.request.getContextPath()}/logo/logo_black2.png" width="170" height="50">
														</a>
												</div>
										</div>
										<!--/.navbar-header-->
										<!-- End Header Navigation -->

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse menu-ui-design"
												id="navbar-menu">
												<ul class="nav navbar-nav navbar-center"
														data-in="fadeInDown" data-out="fadeOutUp">
														<li><a
																href="${pageContext.servletContext.getContextPath()}/app/group/listByJoin">moim</a></li>
														<li><a
																href="${pageContext.servletContext.getContextPath()}/app/co/list">forum</a></li>
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