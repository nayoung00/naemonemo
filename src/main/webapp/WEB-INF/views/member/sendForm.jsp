<%@ page import="java.util.*, java.text.*"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>메시지 입력</h1>
<c:if test="${not empty loginUser}">
<form action='send' method='post'>
<input name='sender' type='hidden' value='${session.loginUser.name}'>
발신자: <input type='text' readonly value='${sender.name}'><br>
수신자: <input name='receiver' type='text' value='${receiver.name}' ><br>
제목: <input name='title' type='text'/><br>
내용: <input name='content' type='text'/><br/>
<input name='createDate' type='date' value='<%

 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 String today = formatter.format(new java.util.Date());

 out.println(today);

%>'/><br/>
<input name='readDate' type='hidden' value='<%

 java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
 String today2 = formatter.format(new java.util.Date());

 out.println(today);

%>'><br>
<button>전송</button>
</form>
</c:if>

<c:if test="${empty loginUser}">
<p>로그인 후 이용가능.</p>
</c:if>
