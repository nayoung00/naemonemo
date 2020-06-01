<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
  $(document).ready(function(){
    var formObj = $("form[name='updateForm']");
    
    $(document).on("click","#fileDel", function(){
      $(this).parent().remove();
    })
    
    fn_addFile();
    
    $(".cancel_btn").on("click", function(){
      event.preventDefault();
      location.href = "/co/detail?coNo=${co.coNo}"
    })
    
    $(".update_btn").on("click", function(){
      if(fn_valiChk()){
        return false;
      }
      formObj.attr("action", "update");
      formObj.attr("method", "post");
      formObj.submit();
    })
  })
    
  function fn_valiChk(){
    var updateForm = $("form[name='updateForm'] .chk").length;
    for(var i = 0; i<updateForm; i++){
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
  var fileNoArry = new Array();
  var fileNameArry = new Array();
  function fn_del(value, name){
    
    fileNoArry.push(value);
    fileNameArry.push(name);
    $("#fileNoDel").attr("value", fileNoArry);
    $("#fileNameDel").attr("value", fileNameArry);
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
              <h1>게시물 변경</h1>
              </div>
              
<form name="updateForm" role="form" action='update' method='post' enctype='multipart/form-data'>

<input type="hidden" name="bno" value="${co.coNo}" readonly="readonly"/>
<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 

번호: <input name='coNo' readonly type='text' value='${co.coNo}'><br>

작성자(멤버조인해서닉네임뜨게): <input name='memberNo' readonly type='text' value='${co.memberNo}'><br>

<div>
      글 분류:<select name="category">
        <option value="공지">공지</option>
        <option value="홍보">홍보</option>
        <option value="구인">구인</option>
        <option value="대여">대여</option>
      </select>
            
</div>
<br>


제목:<input name='title' type='text' value='${co.title}'><br>
내용:<br>
<textarea name='content' rows='5' cols='60'>${co.content}</textarea><br>

작성일: ${co.createDate}<br>
조회수: ${co.viewCount}<br>

<div id="fileIndex">
파일:
  <c:forEach var="file" items="${file}" varStatus="var">
  <div>
    <input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
    <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
    <a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
    <button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
  </div>
  </c:forEach>
  <button type="button" class="fileAdd_btn">파일추가</button>
</div>
<br>                
<div>
  <button type="button" class="update_btn">저장</button>
  <button type="button" class="cancel_btn">취소</button>
</div>
</form>
    
            </div>
          </div>
        </div>
      </div>
    </div>
    