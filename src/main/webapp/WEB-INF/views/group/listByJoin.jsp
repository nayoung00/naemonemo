<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="blog" class="blog">
  <div class="container">
   <div class="section-header">
   </div>
    <div class="blog-content">
     <div class="container-fluid">


  <h1>가입한 모임 리스트</h1>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>모임소개</th>
    <th>오프라인/온라인</th>
    <th>카테고리</th>
    <th>사진</th>
  </tr>
  
<c:forEach items="${listByJoin}" var="item">
  <tr>
    <td>${item.groupNo}</td> 
    <td><a href='${pageContext.servletContext.contextPath}/app/moim/home?groupNo=${item.groupNo}'> ${item.groupName}</a></td> 
    <td>${item.groupInfo}</td>
    <td>${item.groupForm}</td> 
    <td>${item.groupInterest}</td> 
    <td><img src="../../upload/group/${item.groupPhoto}" width='240'></td>
  </tr>
</c:forEach>
</table>

</div>
</div>
</div>
</section>