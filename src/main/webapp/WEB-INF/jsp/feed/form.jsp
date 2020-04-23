<%@page import="com.nmnm.gms.domain.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>피드 변경</h1>

<form action='add' method='post' enctype='multipart/form-data'>
제목: <input name='title' type='text' value='${feed.title}'><br>
사진: <input name='thumbnail' type='file' value='${feed.thumbnail}'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'>${feed.content}</textarea><br>
<button>변경</button>
</form>
<jsp:include page="../footer.jsp"/>