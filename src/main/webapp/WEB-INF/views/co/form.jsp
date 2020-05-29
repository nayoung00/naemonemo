<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<section id="blog" class="blog">
  <div class="container">
    <div class="section-header"></div>

    <div class="blog-content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-plain">
              <div class="header">
<h1>소통게시물 입력</h1>
              </div>
              
<form action='add' method='post' enctype='multipart/form-data'>

작성자(자동입력회원닉네임과조인 띄울필요는없음):<input name='memberNo' type='text'><br>
<br>

<div>
      글 분류:<select name="category">
        <option value="공지">공지</option>
        <option value="홍보">홍보</option>
        <option value="구인">구인</option>
        <option value="대여">대여</option>
      </select>
            
    </div>
<br>
제목: <input name='title' type='text'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'></textarea><br>

사진: <input name='coPhotos' type='file'><br>
사진: <input name='coPhotos' type='file'><br>
사진: <input name='coPhotos' type='file'><br>
사진: <input name='coPhotos' type='file'><br>
사진: <input name='coPhotos' type='file'><br>

<button>등록</button>
</form>

            </div>
          </div>
        </div>
      </div>
    </div>
    