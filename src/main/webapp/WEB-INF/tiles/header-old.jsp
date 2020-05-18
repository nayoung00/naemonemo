<%@page import="com.nmnm.gms.domain.Member"%>
<%@page import="com.nmnm.gms.domain.Plan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class='navbar navbar-expand-lg navbar-dark bg-dark'>
<a class='navbar-brand' href='../../index.html'>네모내모</a>
<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarNav' aria-controls='navbarNav' aria-expanded='false' aria-label='Toggle navigation'>
  <span class='navbar-toggler-icon'></span>
</button>
<div class='collapse navbar-collapse' id='navbarNav'>
  <ul class='navbar-nav mr-auto'>
    <li class='nav-item'>
      <a class='nav-link' href='../notice/list'>공지사항</span></a>
    </li>
    <li class='nav-item'>
      <a class='nav-link' href='../plan/list'>일정</a>
    </li>
    <li class='nav-item'>
      <a class='nav-link' href='../feed/list'>피드</a>
    </li>
    <li class='nav-item'>
      <a class='nav-link' href='../co/list'>소통게시판</a>
    </li>
    <li class='nav-item'>
      <a class='nav-link' href='../member/list'>회원</a>
    </li>
        <li class='nav-item'>
      <a class='nav-link' href='../group/list'>모임</a>
    </li>
        <li class='nav-item'>
      <a class='nav-link' href='../account/list'>회계</a>
    </li>
  </ul>
<c:if test="${not empty loginUser}">
  <span class='navbar-text'>${loginUser.name}</span>
  <a href='../auth/logout' class='btn btn-success btn-sm'>로그아웃</a>
</c:if>
<c:if test="${empty loginUser}">
  <a href='../auth/login' class='btn btn-success btn-sm'>로그인</a>
</c:if> 
</div>
</nav>
