<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1>회계 입력(JSP)</h1>
<form action='add' method='post' enctype='multipart/form-data'>
모임번호: <input name='groupNo' type='text' value='1'><br>
모임계좌아이디: <input name='bankInfoId' type='text' value='1~5'><br>
회계유형명: <input name='accountTypeName' type='text' value='ex) 회의비'><br>
금액: <input name='amount' type='text'><br>
거래일: <input name='paymentDate' type='date'><br>
거래처: <input name='accountConnection' type='text'><br>
비고: <input name='remarks' type='text'><br>
영수증사진: <input name='receiptPhoto' type='file'><br>


<input type='submit' value='등록'/><br>
</form>

