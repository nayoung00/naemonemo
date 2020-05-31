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
        location.href = "detail?noticeNo=${replyUpdate.noticeNo}"
      })
      
    });
    
  </script>
      
        <form name="updateForm" role="form" method="post" action="replyUpdate">
          <input type="hidden" name="noticeNo" value="${replyUpdate.noticeNo}" readonly="readonly"/>
          <input type="hidden" id="noticeReplyNo" name="noticeReplyNo" value="${replyUpdate.noticeReplyNo}" />
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
  