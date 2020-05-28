<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1>피드 변경</h1>

<form action='update' method='post' enctype='multipart/form-data'>

번호: <input name='feedNo'  readonly type='text' value='${feed.feedNo}'><br>
제목: <input name='title' type='text' value='${feed.title}'><br>
내용: <br>
<textarea name='content' rows='5' cols='60'>${feed.content}</textarea><br>

모임번호: <input name='groupNo' type='text'><br>
그룹번호: <input name='memberNo' type='text'><br>

등록일: ${feed.createDate}<br>
조회수: ${feed.viewCount}<br>

사진: <input name='feedPhotos' type='file'><br>
사진: <input name='feedPhotos' type='file'><br>
사진: <input name='feedPhotos' type='file'><br>
사진: <input name='feedPhotos' type='file'><br>
사진: <input name='feedPhotos' type='file'><br>

<p><button>변경</button>

</form>
    