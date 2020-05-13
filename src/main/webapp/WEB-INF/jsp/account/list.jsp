<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<div style="border:1px solid gold; float: left; width: 33%;">
  <h3><a href="list">일별 사용 내역</a></h3>
  <h3><a href="list">월별 사용 내역</a></h3>
  <h3><a href="list">잔액 조회</a></h3>
  <h3><a href="list">회비 내역</a></h3>
  <h3><a href="list">후원금</a></h3>
  <h3><a href="list">법인카드/계좌</a></h3>
</div>

  <h1>일별 사용 내역</h1>
  <a href='form'>사용내역 추가</a><br>
  <table border='1'>
  <tr>
    <th>회계번호</th>
    <th>모임번호</th>
    <th>모임계좌아이디</th>
    <th>회계유형번호</th>
    <th>회계유형명</th>
    <th>잔액</th>
    <th>금액</th>
    <th>거래일</th>
    <th>거래처</th>
    <th>비고</th>
    <th>영수증사진</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.accountNo}</td> 
    <td>${item.groupNo}</td> 
    <td>${item.bankInfoId}</td> 
    <td>${item.accountTypeNo}</td>
    <td>${item.accountTypeName}</td>
    <td>${item.assets}</td>
    <td>${item.amount}</td>
    <td>${item.paymentDate}</td>
    <td>${item.accountConnection}</td>
    <td>${item.remarks}</td>
    <td>${item.receiptPhoto}</td>
  </tr>
</c:forEach>

</table>

<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>

<jsp:include page="../footer.jsp"/>
    