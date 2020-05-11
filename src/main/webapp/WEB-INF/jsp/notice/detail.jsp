<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>
<h1>게시물 상세정보(JSP + EL + JSTL)</h1>

<c:if test="${not empty notice}">
<form action='update' method='post'>
번호: ${notice.noticeNo}<br>
제목: ${notice.title}<br>
내용: <br>
${notice.content}<br>
작성일: ${notice.createDate}<br>
조회수: ${notice.viewCount}<br>
<p><a href='delete?noticeNo=${notice.noticeNo}'>삭제</a> 
<a href='updateForm?noticeNo=${notice.noticeNo}'>변경</a></p>
</form>
</c:if>

<c:if test="${empty notice}">
<p>해당 공지사항 게시물이 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    