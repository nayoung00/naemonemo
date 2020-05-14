<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>회계 입력(JSP)</h1>
<form action='bankAdd' method='post' enctype='multipart/form-data'>
계좌번호: <input name='bankInfoNo' type='text'><br>
회계유형명: <input name='accountTypeName' type='text'><br>
거래일: <input name='paymentDate' type='date'><br>
금액: <input name='amount' type='text'><br>
비고: <input name='remarks' type='text'><br>
잔액: <input name='endingBalance' type='text'><br>

모임계좌아이디: <input name='bankInfoNo' type='text'><br>
모임번호: <input name='accountTypeName' type='text'><br>
거래일: <input name='paymentDate' type='date'><br>
금액: <input name='amount' type='text'><br>
비고: <input name='remarks' type='text'><br>
잔액: <input name='endingBalance' type='text'><br>



<input type='submit' value='upload'/><br>
</form>

<jsp:include page="../footer.jsp"/>