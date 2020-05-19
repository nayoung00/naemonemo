<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <h1>모임 검색 결과</h1>
  <table border='1'>
  <tr>
    <th>이름</th>
    <th>모임형태</th>
    <th>지역</th>
  </tr>

<c:forEach items="${list}" var="item">
  <tr>
  <td><a href='detail?no=${item.groupNo}'>${item.groupName}</a></td> 
  <td>${item.groupForm}</td>
  <td>${item.city}</td>
  </tr>
</c:forEach>

  </table>

    