<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<div class="content">
  <div class="container-fluid">
    <div class="row">
    
  
<h6>공지사항 입력</h6>

<form action='add' method="post" enctype='multipart/form-data'>

제목: <input name='title' type='text'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'></textarea><br>

모임번호: <input name='groupNo' type="number"><br>
<!--  회원번호: <input name='memberNo' type="number"><br>-->

사진: <input name='feedPhotos' type='file'><br>
사진: <input name='feedPhotos' type='file'><br>
사진: <input name='feedPhotos' type='file'><br>
사진: <input name='feedPhotos' type='file'><br>
사진: <input name='feedPhotos' type='file'><br>

<button>등록</button>
</form>


</div>
</div>
</div>