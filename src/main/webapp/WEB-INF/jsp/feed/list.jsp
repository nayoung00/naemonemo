<%@ page import="com.nmnm.gms.domain.Feed"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>피드</h1>
  <a href='form'>새 글</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>생성일</th>
    <th>내용</th>
    <th>회원번호</th>
    <th>모임번호</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.feedNo}</td> 
    <td><a href='detail?no=${item.feedNo}'>=> ${item.title}</a></td> 
    <td>${item.createDate}</td> 
    <td>${item.content}</td> 
    <td>${item.memberNo}</td>
    <td>${item.groupNo}</td>
  </tr>
</c:forEach>

</table>

<jsp:include page="../footer.jsp"/>