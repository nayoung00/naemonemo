<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
  <hr>
<div>
<a class="btn btn-info btn-fill pull-right" href='form'>글쓰기</a>
<br>
</div>
  <hr>
  
<div class="row pt-3 mb-3">
<c:forEach items="${list}" var="item">
  <div class="col-12 col-lg-4 mb-3 text-center">
  
    <div class="card shadow-md transition-all-ease-250 border-secondary bl-0 br-0 bb-0 bw--2">
      <div class="card-body pb-0">
        <!-- <h6 class="card-title mb-0">${item.title}</h6> -->
        <br>
        <div class="transition-hover-top" style="font-size : 20px" onclick="location.href='detail?feedNo=${item.feedNo}'">
        ${item.title}</div>
        <p class="card-text mb-0">
            <img src="${pageContext.servletContext.contextPath}/upload/feed/${item.feedPhotos[0].filepath}" width="300" height="400">
        </p>
<br>
      </div>
    </div>
</div>
</c:forEach>
</div>


</div>

<!-- 
<div class="container">
  <hr>
<div>
<a class="btn btn-info btn-fill pull-right" href='form'>글쓰기</a>
<br>
</div>
  <hr>
  
  <table  class="table table-striped">
  <tr>
    <th>사진</th>
    <th>정보</th>
   
    
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td><img src="${pageContext.servletContext.contextPath}/upload/feed/${item.feedPhotos[0].filepath}" width='360'><br></td>
    <td>
         번호: ${item.feedNo} <br>
         제목:<a href='detail?feedNo=${item.feedNo}'> ${item.title}</a> <br>
         작성자: ${item.nickname} <br>
         등록일: ${item.createDate}<br>
         조회수: ${item.viewCount}<br>
    </td>
    
  </tr>
</c:forEach>

</table>


</div>

 -->