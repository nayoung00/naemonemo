<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>그룹(JSP + EL + JSTL)</h1>
  <a href='form'>그룹 생성</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>소개</th>
    <th>지역</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.groupNo}</td> 
    <td><a href='detail?no=${item.groupNo}'>${item.name}</a></td> 
    <td>${item.info}</td> 
    <td>${item.city}</td>
  </tr>
</c:forEach>

  </table>
<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>

<jsp:include page="../footer.jsp"/>