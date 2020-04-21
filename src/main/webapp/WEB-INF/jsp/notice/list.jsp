<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>공지사항 게시글(JSP + EL + JSTL)</h1>
  <a href='form'>새 글</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>내용</th>
    <th>등록일</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.no}</td> 
    <td><a href='detail?no=${item.noticeBoardNo}'>${item.title}</a></td> 
    <td>${item.title}</td> 
    <td>${item.content}</td>
       <td>${item.createDate}</td>
  </tr>
</c:forEach>

</table>

<jsp:include page="../footer.jsp"/>
    