<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <h1>일정 검색 결과</h1>
  <table border='1'>
  <tr>
    <th>번호</th> 
    <th>제목</th>
    <th>작성일</th>
  </tr>

<c:forEach items="${list}" var="item">
  <tr>
  <td>${item.planNo}</td> 
  <td><a href='detail?planNo=${item.planNo}'>${item.title}</a></td> 
   <td>${item.createDate}</td>
  </tr>
</c:forEach>

  </table>

    