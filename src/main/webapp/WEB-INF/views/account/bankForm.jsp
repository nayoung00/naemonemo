<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1>회계 입력(JSP)</h1>
<form action='bankAdd' method='post' enctype='multipart/form-data'>
모임계좌아이디: <input name='bankInfoId' type='text'><br>
모임번호: <input name='groupNo' type='text'><br>
계좌번호: <input name='bankAccountNo' type='text'><br>
은행명: <input name='bankName' type='text'><br>
기초잔액: <input name='openingBalance' type='text'><br>
예금주: <input name='bankAccountHolder' type='text'><br>




<input type='submit' value='upload'/><br>
</form>

