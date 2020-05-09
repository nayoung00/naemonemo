<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>모임 상세정보</h1>
<c:if test="${not empty group}">
<form>
<img src='${pageContext.servletContext.contextPath}/upload/group/${group.groupPhoto}' height='80'><br>
<p>번호: ${group.groupNo}</p>
<p>이름:${group.groupName}</p>
<p>소개: ${group.groupInfo}</p>
<p>형태: ${group.groupForm}</p>
<p>관심사: ${group.groupInterest}</p>
사진: <input name='photoFile' type='file' value='${group.groupPhoto}'><br>
<p>도시: ${group.city}</p>
<p>생성일: ${group.createDate}</p>
<p><a href='updateForm?no=${group.groupNo}'>변경</a>
<a href='delete?no=${group.groupNo}'>삭제</a></p>
</form>
</c:if>
<c:if test="${empty group}">
<p>해당  모임이 없습니다.</p>
</c:if>
<jsp:include page="../footer.jsp"/>