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
        location.href = "detail?noticeNo=${replyDelete.noticeNo}"
      })
    });
    
  </script>
      
      <section id="container">
        <form name="updateForm" role="form" method="post" action="replyDelete">
          <input type="hidden" name="noticeNo" value="${replyDelete.noticeNo}" readonly="readonly"/>
          <input type="hidden" id="noticeReplyNo" name="noticeReplyNo" value="${replyDelete.noticeReplyNo}" />
            
          <div>
            <p>삭제 하시겠습니까?</p>
            <button type="submit" class="delete_btn">예 삭제합니다.</button>
            <button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
          </div>
        </form>
      </section>
  