<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1>공지사항 입력</h1>

<form action='add' method='post' enctype='multipart/form-data'>

제목: <input name='title' type='text'><br>
내용: <br>
<textarea name='content' rows='5' cols='60'></textarea><br>

모임번호: <input name='groupNo' type='text'><br>
그룹번호: <input name='memberNo' type='text'><br>

사진: <input name='noticePhotos' type='file'><br>
사진: <input name='noticePhotos' type='file'><br>
사진: <input name='noticePhotos' type='file'><br>
사진: <input name='noticePhotos' type='file'><br>
사진: <input name='noticePhotos' type='file'><br>

<button>등록</button>
</form>

    