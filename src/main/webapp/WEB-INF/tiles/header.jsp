<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String str = request.getParameter("groupNo"); %>

   
  <nav class="navbar navbar-default navbar-fixed">
       <div class="container-fluid">
           <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                   <span class="sr-only">Toggle navigation</span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
               </button>
               
               <a class="navbar-brand" href="../moim/home?groupNo=<%=str%>">홈</a>
               <a class="navbar-brand" href="../notice/list?groupNo=<%=str%>">공지</a>
               <a class="navbar-brand" href="../plan/list?groupNo=<%=str%>">일정</a>
               <a class="navbar-brand" href="../account/list?groupNo=<%=str%>">회계</a>
               <a class="navbar-brand" href="../feed/list?groupNo=<%=str%>">피드</a>
               <a class="navbar-brand" href="../member/list?groupNo=<%=str%>">회원</a>
               <a class="navbar-brand" href="../admin/manual?groupNo=<%=str%>">관리</a> 
               <!-- 관리 메뉴 관리자에게만 보이게 조건문 걸기 -->
           </div>
           <div class="collapse navbar-collapse">
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
</nav>

