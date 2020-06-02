<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="sidebar" data-color="orange" data-image="#">
      <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->
      <div class="sidebar-wrapper">
            <div class="logo">
                <a href="../../moim-index.html" class="simple-text">
                                    네모내모 로고
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="groupadmin" class="simple-text">
                        <i class="pe-7s-bell"></i>
                        <p>모임관리</p>
                    </a>
                </li>
                <li>
                    <a href="memberadmin" class="simple-text">
                        <i class="pe-7s-user"></i>
                        <p>회원관리</p>
                    </a>
                </li>
                <li> 
                    <a href="boardadmin" class="simple-text">
                        <i class="pe-7s-note"></i>
                        <p>게시판관리</p>
                    </a>
                </li>
            </ul>
      </div>
    </div>