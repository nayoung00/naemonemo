<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
    
    function fn_fileDown(fileNo){
      var formObj = $("form[name='readForm']");
      $("#FILE_NO").attr("value", fileNo);
      formObj.attr("action", "fileDown");
      formObj.submit();
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
              
              </div>
              
<c:if test="${not empty co}">

<form name="readForm" role="form" method="post">
<input type="hidden" id="bno" name="bno" value="${read.bno}" />
<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
</form>

번호: ${co.coNo}<br>
글 분류: ${co.category}<br>
작성자: ${co.nickname}<br>
제목: ${co.title}<br>
내용: <br>
${co.content}<br>
등록일: ${co.createDate}<br>
조회수: ${co.viewCount}<br>

<hr>
<span>파일 목록</span>
<div class="form-group" style="border: 1px solid #dbdbdb;">
  <c:forEach var="file" items="${file}">
    <a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
  </c:forEach>
</div>
<hr>

<p>
<button><a href='delete?coNo=${co.coNo}'>삭제</a></button>
<button><a href='updateForm?coNo=${co.coNo}'>변경</a></button>
<button><a href="list.jsp">목록</a></button>
</p>
<hr>

</form>
</c:if>

<c:if test="${empty co}">
<p>해당 글이 없습니다.</p>
</c:if>


<br>    

<!-- 댓글 -->
<jsp:include page="replyView.jsp"/>