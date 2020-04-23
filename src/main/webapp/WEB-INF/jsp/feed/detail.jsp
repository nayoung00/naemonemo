<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>피드 상세정보</h1>
<c:if test="${not empty feed}">
<form action='update' method='post' enctype='multipart/form-data'>
<img src='${pageContext.servletContext.contextPath}/upload/feed/${feed.thumbnail}' height='80'><br>
번호: <input name='feedNo' type='text' readonly value='${feed.feedNo}'><br>
제목: <input name='title' type='text' value='${feed.title}'><br>
내용: <input name='content' type='text' value='${feed.content}'><br>
사진: <input name='thumbnail' type='file' value='${feed.thumbnail}'><br>
회원번호: <input name='memberNo' readonly type='text' value='${feed.memberNo}'><br>
모임번호: <input name='groupNo' readonly type='text' value='${feed.groupNo}'><br>
생성일: <input name='createDate' readonly type='date' value='${feed.createDate}'><br>
<p><button>변경</button>
<button><a href='delete?feedNo=${feed.feedNo}'>삭제</a></button>
<%--<a href='../feedPhoto/list?feedNo=${feed.feedNo}'>사진게시판</a>--%>
</p>
</form>
</c:if>

<c:if test="${empty feed}">
<p>해당 피드가 없습니다.</p>
</c:if>
<jsp:include page="../footer.jsp"/>