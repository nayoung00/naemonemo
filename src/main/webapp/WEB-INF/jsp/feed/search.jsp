<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>피드 검색 결과</h1>
  <table border='1'>
  <tr>
    <th>번호</th> 
    <th>제목</th>
    <th>작성일</th>
    <th>회원</th>
    <th>그룹</th>
  </tr>

<c:forEach items="${list}" var="item">
  <tr>
  <td>${item.feedNo}</td> 
  <td><a href='detail?feedNo=${item.feedNo}'>${item.title}</a></td> 
  <td>${item.createDate}</td>
  <td>${item.memberNo}</td>
  <td>${item.groupNo}</td>
  </tr>
</c:forEach>

  </table>

<jsp:include page="../footer.jsp"/>
    