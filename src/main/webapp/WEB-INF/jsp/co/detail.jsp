<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>소통게시물 상세정보(JSP + EL + JSTL)</h1>

<c:if test="${not empty co}">
<form action='update' method='post'>
번호: ${co.coNo}<br>
글 분류: ${co.category}<br>
회원번호: ${co.memberNo}<br>
제목: ${co.title}<br>
내용: <br>
${co.content}<br>
작성일: ${co.createDate}<br>
조회수: ${co.viewCount}<br>
</form>
</c:if>
<a href='updateForm?coNo=${co.coNo}'><input type="submit" value='변경'/></a> 


<a href='delete?coNo=${co.coNo}'>삭제</a>
<c:if test="${empty co}">
<p>해당 글이 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    