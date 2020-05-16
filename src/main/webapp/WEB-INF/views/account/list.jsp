<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<div style="border:1px solid white; float: left;">
  <p><a href="list">모임 계좌 조회</a></p>
  <p>일별 사용 내역(예정)</p>
  <p>월별 사용 내역(예정)</p>
  <p>회비 내역(예정)</p>
  <p>후원금(예정)</p>
  <p><a href="bankList">계좌 추가/제거</a></p>
</div>
<div style="text-align: center; margin: 0 auto;">
  <h1>모임 계좌 조회</h1>
  <table border='1' style="margin:auto;">
  <tr>
    <th>회계번호</th>
    <th>모임계좌아이디</th>
    <th>회계유형명</th>
    <th>금액</th>
    <th>거래일</th>
    <th>거래처</th>
    <th>비고</th>
    <th>영수증사진</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.accountNo}</td> 
    <td>${item.bankInfoId}</td> 
    <td>${item.accountTypeName}</td>
    <td>${item.amount}</td>
    <td>${item.paymentDate}</td>
    <td>${item.accountConnection}</td>
    <td>${item.remarks}</td>
    <td>${item.receiptPhoto}</td>
  </tr>
</c:forEach>

</table>
</div>
  <a href='form' style="float:right;margin-right:200px;">사용내역 추가</a><br>
<br>
<hr>
<div style="text-align: center; margin: 0 auto;"> 
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>
</div>
<br>
    