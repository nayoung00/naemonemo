<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>회계(JSP + EL + JSTL)</h1>
  <a href='form'>새 글</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>계좌번호</th>
    <th>회계유형명</th>
    <th>거래일</th>
    <th>금액</th>
    <th>비고</th>
    <th>잔액</th>
    <th>영수증</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.accountNo}</td> 
    <td><a href='detail?accountNo=${item.accountNo}'> ${item.bankNo}</a></td> 
    <td>${item.accountTypeName}</td>
    <td>${item.paymentDate}</td>
    <td>${item.amount}</td>
    <td>${item.remark}</td>
    <td>${item.assets}</td>
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
    