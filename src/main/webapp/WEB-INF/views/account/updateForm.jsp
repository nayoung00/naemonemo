<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1>회계 변경(JSP + EL + JSTL)</h1>

<form action='update' method='post'>
번호: <input name='accountNo' type='text' readonly value='${account.accountNo}'><br>
계좌번호: <input name='bankInfoNo' type='text'><br>
회계유형명: <input name='accountTypeName' type='text'><br>
거래일: <input name='paymentDate' type='text'><br>
입금: <input name='deposit' type='text'><br>
비고: <input name='remarks' type='text'><br>
출금: <input name='withdraw' type='text'><br>
영수증: <input name='receiptPhoto' type='file'><br>
<p><button>변경</button>
<input type='submit' value='upload'/><br>
</form>
    