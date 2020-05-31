<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
$(function(){
	  // 추천버튼 클릭시(추천 추가 또는 추천 제거)
	  $("#rec_update").click(function(){
	    $.ajax({
	      url: "/expro/RecUpdate.do",
	              type: "POST",
	              data: {
	                  no: ${content.board_no},
	                  id: '${id}'
	              },
	              success: function () {
	            recCount();
	              },
	    })
	  })
	  
	  // 게시글 추천수
	    function recCount() {
	    $.ajax({
	      url: "/expro/RecCount.do",
	              type: "POST",
	              data: {
	                  no: ${content.board_no}
	              },
	              success: function (count) {
	                $(".rec_count").html(count);
	              },
	    })
	    };
	    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
</script>


<h1>피드 상세정보</h1>

<c:if test="${not empty feed}">

번호: ${feed.feedNo}<br>
제목: ${feed.title}<br>
내용: ${feed.content}<br>
회원번호(작성자닉네임조인): ${feed.memberNo}<br>
등록일: ${feed.createDate}<br>
조회수: ${feed.viewCount}<br>

사진:
<br>
<p>
<c:forEach items="${feed.feedPhotos}" var="feedPhoto">
<br>
<img src="${pageContext.servletContext.contextPath}/upload/feed/${feedPhoto.filepath}" width='360'>
<br>
<br>
</c:forEach>
</p>


<p>
<button><a href='delete?feedNo=${feed.feedNo}'>삭제</a></button>
<button><a href='updateForm?feedNo=${feed.feedNo}'>변경</a></button>
<button><a href="list.jsp">목록</a></button>
</p>

</form>
</c:if>

<c:if test="${empty feed}">
<p>해당 게시물이 없습니다.</p>
</c:if>


<br>
<!-- 좋아요 -->
    <div>
      <div class="w3-border w3-center w3-padding">
        <c:if test="${ id == null }">
          추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
          <i class="fa fa-heart" style="font-size:16px;color:red"></i>
          <span class="rec_count"></span>         
        </c:if>
        <c:if test="${ id != null }">
          <button class="w3-button w3-black w3-round" id="rec_update">
            <i class="fa fa-heart" style="font-size:16px;color:red"></i>
            &nbsp;<span class="rec_count"></span>
          </button> 
        </c:if>
      </div>
    </div>


<!-- 댓글화면 -->
<jsp:include page="replyView.jsp"/>