<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h1>모임 홈</h1>

<form items="${group}" var="item">

<p>
<img src="${pageContext.servletContext.contextPath}/upload/group/${item.groupPhoto.filepath}" width='360'>
</p>

번호: ${item.groupNo}<br>
제목: ${item.groupName}<br>
소개: ${item.content}<br>
등록일: ${item.createDate}<br>
조회수: ${item.viewCount}<br>


<p>
<button><a href=''>모임 가입하기</a></button>
</p>

</form>




