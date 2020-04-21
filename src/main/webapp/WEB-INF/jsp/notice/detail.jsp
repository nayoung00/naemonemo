<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>게시물 상세정보(JSP + EL + JSTL)</h1>

<c:if test="${not empty board}">
번호: ${notice.noticeBoardNo}<br>
제목: ${notice.title}<br>
등록일: ${notice.content}<br>
조회수: ${notice.createDate}<br>
<p><a href='delete?no=${notice.noticeBoardNo}'>삭제</a> 
<a href='updateForm?no=${notice.noticeBoardNo}'>변경</a></p>
</c:if>

<c:if test="${empty requestScope.notice}">
<p>해당 공지사항 게시물이 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    