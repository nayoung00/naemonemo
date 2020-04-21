<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>공지사항 입력(JSP)</h1>
<form action='add' method='post' enctype='multipart/form-data'>
제목: <input name='title' type='text'><br>
내용: <input name='content' type='text'><br>
<button>등록</button>
</form>

<jsp:include page="../footer.jsp"/>
    