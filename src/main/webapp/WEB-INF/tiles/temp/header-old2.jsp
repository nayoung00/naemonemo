<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper">
   <div class="sidebar" data-color="orange" data-image="#">

      <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


      <div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                                    모임명
                </a>
            </div>

            <ul class="nav">
                <li>
                    <li class="active">
                    <a href="app/notice/list">
                        <i class="pe-7s-bell"></i>
                        <p>공지사항</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="pe-7s-user"></i>
                        <p>신규회원</p>
                    </a>
                </li>
                <li> 
                    <a href="#">
                        <i class="pe-7s-note"></i>
                        <p>투표하기</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="pe-7s-graph"></i>
                        <p>모임통계</p>
                    </a>
                </li>
                <li>
                <a href="../../index.html" class="simple-text">
                 (임시)나가기
                </a>
                </li>
            </ul>
      </div>
    </div>
    
<div class="main-panel">
<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="../../moim-index.html">모임홈</a>
                    <a class="navbar-brand" href="../notice/list">공지</a>
                    <a class="navbar-brand" href="../plan/list">일정</a>
                    <a class="navbar-brand" href="../account/list">회계</a>
                    <a class="navbar-brand" href="../feed/list">피드</a>
                    <a class="navbar-brand" href="../member/list">회원</a>
                </div>
                <div class="collapse navbar-collapse">


                    <ul class="nav navbar-nav navbar-right">

                         <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell"></i>
                                <b class="caret hidden-sm hidden-xs"></b>
                                <span class="notification hidden-sm hidden-xs">4</span>
                                <p class="hidden-lg hidden-md">
                                    5 알림
                                    <b class="caret"></b>
                                </p>
                            </a>
                            <ul class="dropdown-menu">
                            <li><a href="#">알림 1</a> </li>
                            <li><a href="#">알림 2</a></li>
                            <li><a href="#">알림 3</a></li>
                            <li><a href="#">알림 4</a></li>
                            <li><a href="#">전체알림보기</a></li>
                            </ul>
                         </li>
                         <li class="message">
                           <a href="#">
                            <i class="fa fa-envelope"></i>
                           </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">마이페이지</a></li>
                                <li><a href="#">로그아웃</a></li>
                              </ul>
                        </li>
            <li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
            </div>
        </nav>