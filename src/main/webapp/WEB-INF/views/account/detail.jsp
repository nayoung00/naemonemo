<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>회계 상세정보(JSP + EL + JSTL)</h1>
<c:if test="${not empty account}">
<form action='update' method='post' enctype='multipart/form-data'>
<img src='${pageContext.servletContext.contextPath}/upload/accoutphoto/${account.receiptPhoto}' height='80'><br>
번호: <input name='accountNo' type='text' readonly value='${account.accountNo}'><br>
계좌번호: <input name='bankInfoNo' type='text' value='${account.bankNo}'><br>
회계유형명: <input name='accountTypeName' type='text' value='${account.accountTypeName}'><br>
거래일: <input name='paymentDate' type='text' value='${account.paymentDate}'><br>
금액: <input name='amount' type='text' value='${account.amount}'><br>
비고: <input name='remarks' type='text' value='${account.remark}'><br>
잔액: <input name='endingBalance' type='text' value='${account.endingBalance}'><br>
영수증: <input name='receiptPhotoFile' type='file' value='${account.receiptPhoto}'><br>
<p><button>변경</button>
<a href='delete?accountNo=${account.accountNo}'>삭제</a></p>
</form>
</c:if>

<c:if test="${empty account}">
<p>해당 회원이 없습니다.</p>
</c:if>
