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
<h1>소통게시물 변경(JSP + EL + JSTL)</h1>
              </div>
              
<form action='update' method='post' enctype='multipart/form-data'>

번호: <input name='coNo' readonly type='text' value='${co.coNo}'><br>

<div>
      글 분류:<select name="category">
        <option value="공지">공지</option>
        <option value="홍보">홍보</option>
        <option value="구인">구인</option>
        <option value="대여">대여</option>
      </select>
            
    </div>
<br>

작성자(멤버조인해서닉네임뜨게): <input name='memberNo' readonly type='text' value='${co.memberNo}'><br>

제목:<input name='title' type='text' value='${co.title}'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'>${co.content}</textarea><br>

작성일: ${co.createDate}<br>
조회수: ${co.viewCount}<br>

사진: <input name='coPhotos' type='file'><br>
사진: <input name='coPhotos' type='file'><br>
사진: <input name='coPhotos' type='file'><br>
사진: <input name='coPhotos' type='file'><br>
사진: <input name='coPhotos' type='file'><br>

<button>변경</button>
</form>
    
                </div>
          </div>
        </div>
      </div>
    </div>
    