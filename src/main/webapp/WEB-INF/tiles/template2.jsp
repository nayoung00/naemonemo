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

    <tiles:insertAttribute name="top"/>

    <tiles:insertAttribute name="body"/>

    <tiles:insertAttribute name="bottom"/>

</body>
</html>