<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="blog" class="blog">
  <div class="container">
    <div class="section-header"></div>

    <div class="blog-content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-plain">
              <div class="header">
                <h1>댓글수정</h1>
              
              </div>
              
<c:if test="${not empty co}">

번호: ${co.coNo}<br>
글 분류: ${co.category}<br>
회원번호(작성자닉네임조인): ${co.memberNo}<br>
제목: ${co.title}<br>
내용: <br>
${co.content}<br>
등록일: ${co.createDate}<br>
조회수: ${co.viewCount}<br>

사진:
<br>
<p>
<c:forEach items="${co.coPhotos}" var="coPhoto">
<br>
<img src="${pageContext.servletContext.contextPath}/upload/co/${coPhoto.filepath}" width='360'>
<br>
<br>
</c:forEach>
</p>

<p>
<button><a href='delete?coNo=${co.coNo}'>삭제</a></button>
<button><a href='updateForm?coNo=${co.coNo}'>변경</a></button>
<button><a href="list.jsp">목록</a></button>
</p>

</form>
</c:if>

<c:if test="${empty co}">
<p>해당 글이 없습니다.</p>
</c:if>


<br>    

<!-- 댓글 -->
<jsp:include page="replyView.jsp"/>