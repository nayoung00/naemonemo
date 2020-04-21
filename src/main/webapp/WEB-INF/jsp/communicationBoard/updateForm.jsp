<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>소통게시물 변경(JSP + EL + JSTL)</h1>

<form action='update' method='post'>
번호: <input name='communicationBoardNo' readonly type='text' value='${communicationBoard.communicationBoardNo}'><br>
회원번호: <input name='memberNo' readonly type='text' value='${communicationBoard.memberNo}'><br>
제목:<input name='title' type='text' value='${communicationBoard.title}'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'>${communicationBoard.content}</textarea><br>
작성일: ${communicationBoard.createDate}<br>
조회수: ${communicationBoard.viewCount}<br>
<button>변경</button>
</form>
<jsp:include page="../footer.jsp"/>