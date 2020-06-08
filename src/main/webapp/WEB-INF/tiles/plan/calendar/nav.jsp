<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String str = request.getParameter("groupNo"); %>
   
       <div class="container-fluid">
           <div class="collapse navbar-collapse">

      <ul class="nav navbar-nav navbar-right">
          <c:if test="${not empty loginUser}">
           <li><a href='../auth/logout'>Logout</a></li>
           <li><a href='../member/mypage'>Mypage</a></li>
         </c:if> 
         <c:if test="${empty loginUser}">
           <a href='../auth/login'>Login</a>
         </c:if>
      </ul>
           </div>
        </div>
 