<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
  $(document).ready(function(){
    $(".replyWriteBtn").on("click", function(){
      var formObj = $("form[name='replyForm']");
      formObj.attr("action", "replyWrite");
      formObj.submit();
    });
    
  //댓글 수정 View
    $(".replyUpdateBtn").on("click", function(){
      location.href = "replyUpdateView?coNo=${co.coNo}"
              + "&coReplyNo="+$(this).attr("data-rno");
    });
        
  //댓글 삭제 View
    $(".replyDeleteBtn").on("click", function(){
      location.href = "replyDeleteView?coNo=${co.coNo}"
        + "&coReplyNo="+$(this).attr("data-rno");
    });
  })
</script>


<h3>댓글</h3>

<!-- 댓글 목록 보기-->
<div id="reply">
  <ol class="replyList">
    <c:forEach items="${replyList}" var="replyList">
      <li>
      
        <p>
                  작성자 : ${replyList.memberNo} <br/>
                  작성일 : ${replyList.createDate}
        </p>
        
        <p>
        ${replyList.content}
        </p>
        
				<div>
				  <button type="button" class="replyUpdateBtn" data-rno="${replyList.coReplyNo}">수정</button>
				  <button type="button" class="replyDeleteBtn" data-rno="${replyList.coReplyNo}">삭제</button>
				</div>
      
      </li>
    </c:forEach>  
  </ol>
</div>

<br>

<!-- 댓글작성 replyForm / replyWrite -->
<h3>댓글작성</h3>

<form name="replyForm" method="post">
  
  <input type="hidden" id="coNo" name="coNo" value="${co.coNo}" />

  <div>
    <label for="memberNo">댓글 작성자</label><input type="number" id="memberNo" name="memberNo" />
    <br/>
    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
  
  </div>
  
  <div>
   <button type="button" class="replyWriteBtn">작성</button>
  </div>

</form>
