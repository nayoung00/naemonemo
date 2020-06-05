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
        <br>
        <br>

            <ul class="nav">
                <li>
                    <a href="list">
                        <i class="pe-7s-user"></i>
                        <p>회원보기</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="pe-7s-user"></i>
                        <p>신규회원</p>
                    </a>
                </li>
 
              </ul>
      </div>
    </div>