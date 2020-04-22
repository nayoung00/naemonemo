<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>일정</h1>
  <a href='form'>새 글</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>제목</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.planBoardNo}</td> 
    <td><a href='detail?planBoardNo=${item.planBoardNo}'> ${item.title}</a></td> 
  </tr>
</c:forEach>

</table>
<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>

<jsp:include page="../footer.jsp"/>