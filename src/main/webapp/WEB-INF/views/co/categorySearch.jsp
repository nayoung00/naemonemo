<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<div style="text-align: center; margin: 0 auto;">
  <h1>게시판 검색 결과</h1>
    <hr>
  <form action='categorySearch' method='get'>
    글 분류  :  <label><input type='radio' name='keyword2' value='공지' />공지</label> <label><input
      type='radio' name='keyword2' value='홍보' />홍보</label> <label><input
      type='radio' name='keyword2' value='구인' />구인</label> <label><input
      type='radio' name='keyword2' value='대여' />대여</label>
    <button>전송</button>
    <!--   <a href='list'>전체</a>
  <a href='' id='공지' type='text'>공지</a>
  <a href='categorySearch' id='홍보' type='text'>홍보</a>
  <a href='categorySearch' id='구인' type='text'>구인</a>
  <a href='categorySearch' id='대여' type='text'>대여</a><br> -->
    <br>
  </form>
</div>
 <div style="width:700px;margin:0 auto;">
<a href='form' style="float:right;margin-right:75px;">새 글</a>
</div>
<br>
<div style="width:700px;margin:0 auto;">
<table border='1' style="margin:auto;"> 
  <tr class="w3-teal" align="center">
    <th>번호</th>
    <th>글 분류</th>
    <th>회원번호</th>
    <th>제목</th>
    <th>작성일</th>
    <th>조회수</th>
  </tr>
  <c:forEach items="${list}" var="item">
    <tr>
      <td align="center">${item.coNo}</td>
      <td align="center">${item.category}</td>
      <td align="center">${item.memberNo}</td>
      <td><a
        href='detail?coNo=${item.coNo}'>
          ${item.title}</a></td>
      <td align="center">${item.createDate}</td>
      <td align="center">${item.viewCount}</td>
    </tr>
  </c:forEach>

</table>
</div>
<hr>
<div style="text-align: center; margin: 0 auto;">
<form action='search' method='get'>
  검색어: <input name='keyword' type='text'>
  <button class="w3-button w3-round-large w3-teal w3-small">검색</button>
</form>
</div>
<br>
<br>


<br>
<br>

    