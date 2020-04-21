<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>소통게시물 상세정보(JSP + EL + JSTL)</h1>

<c:if test="${not empty communicationBoard}">
<form action='update' method='post'>
번호: ${communicationBoard.communicationBoardNo}<br>
회원번호: ${communicationBoard.memberNo}<br>
제목: ${communicationBoard.title}<br>
내용: <br>
${communicationBoard.content}<br>
작성일: ${communicationBoard.createDate}<br>
조회수: ${communicationBoard.viewCount}<br>
</form>
</c:if>
<a href='updateForm?communicationBoardNo=${communicationBoard.communicationBoardNo}'><input type="submit" value='변경'/></a> 
<a href='delete?communicationBoardNo=${communicationBoard.communicationBoardNo}'>삭제</a>
<c:if test="${empty communicationBoard}">
<p>해당 글이 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    