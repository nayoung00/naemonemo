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
    <th>그루비름</th>
  </tr>

  <tr>
  <td>${search.no}</td> 
  <td><a href='detail?planBoardNo=${search.no}'>${search.name}</a></td> 
  <td>${search.nickname}</td>
  <td>${search.group.groupName}</td>
  </tr>

  </table>

    