<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

    <style>
      img { display: block; margin: 0px auto; }
      div { text-align: center; }
    </style>

<div class="content">
 <div class="container-fluid">
  <div class="row">
                
<h1></h1>

<c:if test="${not empty group}">

<div style="text-align: center;">
<img src="${pageContext.servletContext.contextPath}/upload/group/${group.groupPhoto}" width='360'>


<!-- 번호: ${group.groupNo}<br> -->
<br>
<h4>${group.groupName}<br><br></h4>
${group.groupInfo}<br><br>
${group.createDate}<br><br>
</div>

<p>
<form action=''>
<button><a href=''>모임 가입하기</a></button>
</form>
</p>

</c:if>

<c:if test="${empty group}">
<p>해당 모임이 없습니다.</p>
</c:if>


</div>
</div>
</div>