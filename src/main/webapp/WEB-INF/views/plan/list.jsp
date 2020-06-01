<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty loginUser}">
  <h1>일정</h1>
  <form action="form" method="POST">
  <input type="hidden" name="groupNo" value="${param.groupNo}" />
  <button>일정 작성</button>
  </form>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>제목</th>
     <th>작성일</th>
     <th>참가신청</th>
  </tr>
  <c:forEach items="${list}" var="item">
  <tr>
    <td>${item.planNo}</td> 
    <td><a href='calendar?planNo=${item.planNo}'> ${item.title}</a></td> 
    <td>${item.createDate}</td>
    <td><a href='calendar?groupNo=${param.groupNo}'> ${item.title}</a></td> 
  </tr>
</c:forEach>
</c:if>
<c:if test="${empty loginUser}">
    <p>로그인이 필요한 페이지 입니다.</p>
    <a href="../auth/login"><button>로그인</button></a>
</c:if>


</table>
<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>


