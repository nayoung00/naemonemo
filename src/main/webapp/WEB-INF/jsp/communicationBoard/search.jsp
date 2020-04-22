<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>게시판 검색 결과(JSP + EL + JSTL)</h1>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>회원번호</th>
    <th>제목</th>
    <th>작성일</th>
    <th>조회수</th>
  </tr>

<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.communicationBoardNo}</td> 
    <td>${item.memberNo}</td> 
    <td><a href='detail?communicationBoardNo=${item.communicationBoardNo}'>=> ${item.title}</a></td>
    <td>${item.createDate}</td> 
    <td>${item.viewCount}</td>
  </tr>
</c:forEach>

  </table>
<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>
<jsp:include page="../footer.jsp"/>
    