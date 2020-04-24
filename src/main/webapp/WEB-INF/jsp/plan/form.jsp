<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<form action='add' method='post' enctype='multipart/form-data'>
<h1 style='text-align:center'> 일정 등록하기</h1>
제목: <input name='title' type='text'/><br>
일정: <input name='planDate' type='date'><br>
장소: <input name='placeName' type='text'/><br/>
주소: <textarea name='address' rows='1' cols='60'></textarea><br>
내용: <input name='content' type='text'/><br/>
사진: <input name='thumbnailFile' type='file'><br>

<button>제출</button>
</form>


<jsp:include page="../footer.jsp"/>