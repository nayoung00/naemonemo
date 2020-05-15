<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>피드 상세정보</h1>

<c:if test="${not empty feed}">
<form action='update' method='post'>
번호: ${feed.feedNo}<br>
제목: ${feed.title}<br>
내용: ${feed.content}<br>
회원번호(작성자닉네임): ${feed.memberNo}<br>
생성일: ${feed.createDate}<br>
조회수: ${feed.viewCount}<br>
<p>
<button><a href='delete?feedNo=${feed.feedNo}'>삭제</a></button>
<button><a href='updateForm?feedNo=${feed.feedNo}'>변경</a></button>
</p>
</form>
</c:if>

<c:if test="${empty feed}">
<p>해당 피드가 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>