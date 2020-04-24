<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1><input name='title' style='text-align:center' type='text' value='${plan.title}'></h1>
<c:if test="${not empty plan}">
<form action='update' method='post' enctype='multipart/form-data'>
<img src='${pageContext.servletContext.contextPath}/upload/plan/${plan.thumbnail}' height='80'><br>
<input name='planBoardNo' type='hidden' value='${plan.planBoardNo}'>
일정: <input name='planDate' type='date' value='${plan.planDate}'><br>
장소: <input name='placeName' type='text' value='${plan.placeName}'><br>
주소: <input name='address' type='text' value='${plan.address}'><br>
내용: <input name='content' type='text' value='${plan.content}'><br>
<input name='thumbnailFile' type='file' value='${plan.thumbnail}'><br>

<p><button>변경</button>
<a href='delete?planBoardNo=${plan.planBoardNo}'>삭제</a></p>
</form>
</c:if>

<c:if test="${empty plan}">
<p>해당 일정이 없습니다.</p>
</c:if>
<jsp:include page="../footer.jsp"/>