<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <h1>모임</h1>
  <a href='form'>모임 생성</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>모임 형태</th>
    <th>지역</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.groupNo}</td> 
    <td><a href='detail?no=${item.groupNo}'>${item.groupName}</a></td> 
    <td>${item.groupForm}</td> 
    <td>${item.city}</td>
  </tr>
</c:forEach>

  </table>
<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>

