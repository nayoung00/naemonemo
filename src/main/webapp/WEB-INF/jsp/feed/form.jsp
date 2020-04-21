<%@page import="com.nmnm.gms.domain.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>피드 변경</h1>

<form action='update' method='post'>
번호: <input name='feedNo' readonly type='text' value='${feed.feedNo}'><br>
제목: <input name='name' type='text' value='${feed.title}'><br>
내용:<br>
<textarea name='title' rows='5' cols='60'>${feed.content}</textarea><br>
등록일: ${board.date}<br>
조회수: ${board.viewCount}<br>
<button>변경</button>
</form>
<jsp:include page="../footer.jsp"/>
    