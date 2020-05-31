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
        location.href = "detail?coNo=${replyUpdate.coNo}"
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
                <h1>댓글수정</h1>
              
              </div>
      
        <form name="updateForm" role="form" method="post" action="replyUpdate">
          <input type="hidden" name="coNo" value="${replyUpdate.coNo}" readonly="readonly"/>
          <input type="hidden" id="coReplyNo" name="coReplyNo" value="${replyUpdate.coReplyNo}" />
          <table>
            <tbody>
              <tr>
                <td>
                  <label for="content">댓글 내용</label><input type="text" id="content" name="content" value="${replyUpdate.content}"/>
                </td>
              </tr> 
              
            </tbody>      
          </table>
          <div>
            <button type="submit" class="update_btn">저장</button>
            <button type="button" class="cancel_btn">취소</button>
          </div>
        </form>
  
              </div>
          </div>
        </div>
      </div>
    </div>