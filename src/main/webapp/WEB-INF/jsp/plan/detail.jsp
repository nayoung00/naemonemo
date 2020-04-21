<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>일정 정보</h1>
<c:if test="${not empty plan}">
<form action='update' method='post'>
<input name='planBoardNo' type='hidden' value='${plan.planBoardNo}'>
일정: <input name='planDate' type='date' value='${plan.planDate}'><br>
제목: <input name='title' type='text' value='${plan.title}'><br>
장소: <input name='placeName' type='text' value='${plan.placeName}'><br>
주소: <input name='address' type='text' value='${plan.address}'><br>
위도: <input name='latitude' type='text' value='${plan.latitude}'><br>
경도: <input name='longitude' type='text' value='${plan.longitude}'><br>
<p><button>변경</button>
<a href='delete?planBoardNo=${plan.planBoardNo}'>삭제</a></p>
</form>
</c:if>

<c:if test="${empty plan}">
<p>해당 일정이 없습니다.</p>
</c:if>
<jsp:include page="../footer.jsp"/>
    