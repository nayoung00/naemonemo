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

  <!-- Bootstrap core CSS     -->
  <link href="${pageContext.servletContext.getContextPath()}/css/bootstrap.min.css" rel="stylesheet" />
  
  <!-- Animation library for notifications   -->
  <link href="${pageContext.servletContext.getContextPath()}/css/animate.min.css" rel="stylesheet"/>

  <!--  Light Bootstrap Table core CSS    -->
  <link href="${pageContext.servletContext.getContextPath()}/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>

  <!--     Fonts and icons     -->
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
  <link href="${pageContext.servletContext.getContextPath()}/css/pe-icon-7-stroke.css" rel="stylesheet" />


  <!--   Core JS Files   -->
  <script src="${pageContext.servletContext.getContextPath()}/js/jquery.3.2.1.min.js" type="text/javascript"></script>
  <script src="${pageContext.servletContext.getContextPath()}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js' integrity='sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo' crossorigin='anonymous'></script>
	
	<!-- sweetAlert CDN -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
  <script src="${pageContext.servletContext.getContextPath()}/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

  <!--  Notifications Plugin    -->
  <script src="${pageContext.servletContext.getContextPath()}/js/bootstrap-notify.js"></script>

  <!--  Charts Plugin -->
  <script src="${pageContext.servletContext.getContextPath()}/js/chartist.min.js"></script>
  
  <!--  kakao Maps Plugin    -->
 
</head>

<body>
<div class="wrapper">
  <tiles:insertAttribute name="side"/>

<div class="main-panel">
  <tiles:insertAttribute name="header"/>
  <tiles:insertAttribute name="body"/>
  <tiles:insertAttribute name="footer"/>
</div>
</div>

<!-- modal폼 관련 태그들 -->
    <!-- grMember 관련 modal -->  
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        모임에 가입하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>