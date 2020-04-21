<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>공지사항 변경(JSP + EL + JSTL)</h1>

<form action='update' method='post'>
번호: <input name='no' readonly type='text' value='${notice.noticeBoardNo}'><br>
제목:<br>
<textarea name='title' rows='5' cols='60'>${notice.title}</textarea><br>
내용:<br>
<textarea name='contents' rows='5' cols='60'>${notice.content}</textarea><br>
등록일: ${board.createDate}<br>
<button>변경</button>
</form>
<jsp:include page="../footer.jsp"/>
    