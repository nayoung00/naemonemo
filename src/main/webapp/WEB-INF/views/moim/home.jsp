<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h1>모임 홈 = 값이 안받아 와진다</h1>

<c:if test="${not empty group}">

<p>
<img src="${pageContext.servletContext.contextPath}/upload/group/${groupPhoto.filepath}" width='360'>
</p>

번호: ${group.groupNo}<br>
제목: ${group.groupName}<br>
소개: ${group.groupInfo}<br>
등록일: ${group.createDate}<br>


<p>
<form action=''>
<button><a href=''>모임 가입하기</a></button>
</form>
</p>

</c:if>

<c:if test="${empty group}">
<p>해당 모임이 없습니다.</p>
</c:if>
