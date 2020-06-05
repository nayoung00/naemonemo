<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar" data-color="orange" data-image="#">
      <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->
      <div class="sidebar-wrapper">
        <div class="logo" style="margin:20px 45px;">    
            <a href="../../index.html"> 
            <img src="${pageContext.request.getContextPath()}/logo/logo_white2.png"  width="170" height="50" alt="..." class="logo" >
            </a>
        </div>

            <ul class="nav">
                <li>
                    <a href="#">
                        <p>타일즈때문에사이드임시로만듬 로그인, 회원가입도jsp가아니라 html로 페이지 깔끔하게 따로 만들어야 할 듯 왜냐하면 로그인 전에는 사이드바와 상단메뉴가 보이면 안되니까 타일즈에 적용할 수 없는 페이지임</p>
                    </a>
                </li>
            </ul>
      </div>
    </div> 