<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/calendar/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/calendar/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='${pageContext.servletContext.getContextPath()}/calendar/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='${pageContext.servletContext.getContextPath()}/calendar/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="${pageContext.servletContext.getContextPath()}/calendar/css/main.css">
</head>