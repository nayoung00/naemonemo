<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>모임 상세정보(JSP + EL + JSTL)</h1>
<c:if test="${not empty group}">
<form action='update' method='post' enctype='multipart/form-data'>
<img src='${pageContext.servletContext.contextPath}/upload/group/${group.photo}' height='80'><br>
번호: <input name='groupNo' type='text' readonly value='${group.groupNo}'><br>
이름: <input name='name' type='text' value='${group.name}'><br>
소개: <input name='info' type='text' value='${group.info}'><br>
사진: <input name='photoFile' type='file' value='${group.photo}'><br>
도시: <input name='city' type='text' value='${group.city}'><br>
생성일: <input name='createDate' readonly type='date' value='${group.createDate}'><br>
<p><button>변경</button>
<a href='delete?no=${group.groupNo}'>삭제</a></p>
</form>
</c:if>
<c:if test="${empty group}">
<p>해당  모임이 없습니다.</p>
</c:if>
<jsp:include page="../footer.jsp"/>