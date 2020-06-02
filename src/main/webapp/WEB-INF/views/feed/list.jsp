<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <h1>피드</h1>
  <a href='form'>새 글</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>회원번호(작성자)</th>
    <th>등록일</th>
    <th>조회수</th>
    <th>사진</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.feedNo}</td> 
    <td><a href='detail?feedNo=${item.feedNo}'> ${item.title}</a></td> 
    <td>${item.memberNo}</td>
    <td>${item.createDate}</td> 
    <td><c:out value="${item.viewCount}"/></td>
    <td><img src="${pageContext.servletContext.contextPath}/upload/feed/${item.feedPhotos[0].filepath}" width='240'></td>
  </tr>
</c:forEach>

</table>

<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>

