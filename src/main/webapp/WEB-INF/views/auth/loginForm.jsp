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
            
            
<h1>로그인 결과</h1>
<c:if test="${not empty loginUser}">
<p>'${loginUser.name}'님 환영합니다.</p>
</c:if>

<c:if test="${empty loginUser}">
<p>사용자 정보가 유효하지 않습니다.</p>
</c:if>


</div>
</div>
</div>
</div>
</div>
</div>
</section>
