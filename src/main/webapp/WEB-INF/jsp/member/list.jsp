<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>회원(JSP + EL + JSTL)</h1>
  <a href='form'>새 회원</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>닉네임</th>
    <th>성별</th>
    <th>이메일</th>
    <th>전화</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.no}</td> 
    <td><a href='detail?no=${item.no}'>${item.name}</a></td> 
    <td>${item.nickname}</td> 
    <td>${item.gender}</td> 
    <td>${item.email}</td> 
    <td>${item.tel}</td>
    <td><a href='sendForm?no=${item.no}'>쪽지 보내기</a></td> 
  </tr>
</c:forEach>

  </table>
<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>

<jsp:include page="../footer.jsp"/>