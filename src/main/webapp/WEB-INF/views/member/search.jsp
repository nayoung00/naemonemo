<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <h1>회원 검색 결과</h1>
  <table border='1'>
  <tr>
    <th>번호</th> 
    <th>이름</th>
    <th>닉네임</th>
    <th>성별</th>
    <th>전화</th>
  </tr>

<c:forEach items="${list}" var="item">
  <tr>
  <td>${item.no}</td> 
  <td><a href='detail?planBoardNo=${item.no}'>${item.name}</a></td> 
  <td>${item.nickname}</td>
  <td>${item.gender}</td>
  <td>${item.tel}</td>
  </tr>
</c:forEach>

  </table>

    