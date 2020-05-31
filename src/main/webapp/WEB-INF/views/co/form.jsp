<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<script type="text/javascript">
  $(document).ready(function(){
    var formObj = $("form[name='writeForm']");
    $(".write_btn").on("click", function(){
      if(fn_valiChk()){
        return false;
      }
      formObj.attr("action", "add");
      formObj.attr("method", "post");
      formObj.submit();
    });
    fn_addFile();
  })
  function fn_valiChk(){
    var regForm = $("form[name='writeForm'] .chk").length;
    for(var i = 0; i<regForm; i++){
      if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
        alert($(".chk").eq(i).attr("title"));
        return true;
      }
    }
  }
  function fn_addFile(){
    var fileIndex = 1;
    //$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
    $(".fileAdd_btn").on("click", function(){
      $("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
    });
    $(document).on("click","#fileDelBtn", function(){
      $(this).parent().remove();
      
    });
  }
</script>

<section id="blog" class="blog">
  <div class="container">
    <div class="section-header"></div>

    <div class="blog-content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-plain">
              <div class="header">
              <h1>포럼 입력</h1>
              </div>
              
<form name="writeForm" action='add' method='post' enctype="multipart/form-data">
<!--
<input name='memberNo' type='hidden'><br>
<br>
-->

회원번호(작성자조인): <input name='memberNo' type='text'><br>

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

<div id="fileIndex">
파일:
<input type="file" name="file">

<button class="fileAdd_btn" type="button">파일추가</button> 
</div>
<button class="write_btn" type="submit">작성</button> 
</form>

            </div>
          </div>
        </div>
      </div>
    </div>
    