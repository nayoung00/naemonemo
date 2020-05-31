<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


  <script type="text/javascript">
    $(document).ready(function(){
      var formObj = $("form[name='updateForm']");
      
      $(".cancel_btn").on("click", function(){
        location.href = "detail?coNo=${replyDelete.coNo}"
      })
    });
    
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
                <h1>댓글삭제</h1>
              
              </div>
              
        <form name="updateForm" role="form" method="post" action="replyDelete">
          <input type="hidden" name="coNo" value="${replyDelete.coNo}" readonly="readonly"/>
          <input type="hidden" id="coReplyNo" name="coReplyNo" value="${replyDelete.coReplyNo}" />
            
          <div>
            <p>삭제 하시겠습니까?</p>
            <button type="submit" class="delete_btn">예 삭제합니다.</button>
            <button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
          </div>
        </form>
  
              </div>
          </div>
        </div>
      </div>
    </div>