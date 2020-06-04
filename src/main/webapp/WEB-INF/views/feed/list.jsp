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
  
  <table  class="table table-striped">
  <tr>
    <th>사진</th>
    <th>정보</th>
   
    
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td><img src="${pageContext.servletContext.contextPath}/upload/feed/${item.feedPhotos[0].filepath}" width='500'><br></td>
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
