<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1>공지사항 변경</h1>

<form action='update' method='post'>

번호: <input name='noticeNo' readonly type='text' value='${notice.noticeNo}'><br>
모임번호: <input name='groupNo' type='text'><br>
그룹번호: <input name='memberNo' type='text'><br>
제목:<br>
<input name='title' type='text' value='${notice.title}'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'>${notice.content}</textarea><br>
등록일: ${notice.createDate}<br>
조회수: ${notice.viewCount}<br>

<p><button>변경</button>

</form>

    