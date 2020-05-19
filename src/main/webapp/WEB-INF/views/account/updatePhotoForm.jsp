<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1>영수증 파일 변경</h1>

<form action='update' method='post' enctype='multipart/form-data'>
<input name='groupNo' type='hidden' value='${account.groupNo}'>
회계번호 : <input name='accountNo' type='hidden' value='${account.accountNo}'>
${account.accountNo}<br>
<input name='bankInfoId' type='hidden' value='${account.bankInfoId}'>
<input name='accountTypeName' type='hidden' value='${account.accountTypeName}'>
<input name='endingBalance' type='hidden'  value='${account.endingBalance}'>
<input name='amount' type='hidden' value='${account.amount}'>
<input name='paymentDate' type='hidden' value='${account.paymentDate}'>
<input name='accountConnection' type='hidden' value='${account.accountConnection}'>
<input name='remarks' type='hidden' value='${account.remarks}'>
영수증사진 : ${account.receiptPhoto}
<br>
<input name='receiptPhotoFile' type='file' value='${account.receiptPhoto}'>
<br>
<input type='submit' value='변경'/><br>
</form>
    