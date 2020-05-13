<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1">




<br>
<div style="text-align: center; margin: 0 auto;">
	<h1>소통 게시판</h1>
	<hr>
	<form action='categorySearch' method='get'>
		글 분류  :  <label><input type='radio' name='keyword2' value='공지' />공지</label> <label><input
			type='radio' name='keyword2' value='홍보' />홍보</label> <label><input
			type='radio' name='keyword2' value='구인' />구인</label> <label><input
			type='radio' name='keyword2' value='대여' />대여</label>
		<button>전송</button>
		<!--   <a href='list'>전체</a>
  <a href='' id='공지' type='text'>공지</a>
  <a href='categorySearch' id='홍보' type='text'>홍보</a>
  <a href='categorySearch' id='구인' type='text'>구인</a>
  <a href='categorySearch' id='대여' type='text'>대여</a><br> -->
		<br>
	</form>
</div>
<div style="width:700px;margin:0 auto;">
<a href='form' style="float:right;margin-right:75px;">새 글</a>
</div>
<br>
<div style="width:700px;margin:0 auto;">
<table border='1' style="margin:auto;"> 
	<tr class="w3-teal" align="center">
		<th>번호</th>
		<th>글 분류</th>
		<th>회원번호</th>
		<th>제목</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${list}" var="item">
		<tr>
			<td align="center">${item.coNo}</td>
			<td align="center">${item.category}</td>
			<td align="center">${item.memberNo}</td>
			<td><a
				href='detail?coNo=${item.coNo}'>
					${item.title}</a></td>
			<td align="center">${item.createDate}</td>
			<td align="center">${item.viewCount}</td>
		</tr>
	</c:forEach>

</table>
</div>
<hr>
<div style="text-align: center; margin: 0 auto;"> 
<form action='search' method='get'>
	검색어: <input name='keyword' type='text'>
	<button class="w3-button w3-round-large w3-teal w3-small">검색</button>
</form>
</div>
<br>

<!-- 
<div class="w3-center">
<div class="w3-bar w3-border w3-round" style="margin:auto;">
  <a href="#" class="w3-bar-item w3-button w3-hover-red">&laquo;</a>
  <a href="#" class="w3-button w3-hover-teal">1</a>
  <a href="#" class="w3-button w3-hover-teal">2</a>
  <a href="#" class="w3-button w3-hover-teal">3</a>
  <a href="#" class="w3-button w3-hover-teal">4</a>
  <a href="#" class="w3-button w3-hover-teal">5</a>
  <a href="#" class="w3-button w3-hover-teal">6</a>
  <a href="#" class="w3-button w3-hover-teal">7</a>
  <a href="#" class="w3-button w3-hover-teal">8</a>
  <a href="#" class="w3-button w3-hover-teal">9</a>
  <a href="#" class="w3-button w3-hover-teal">10</a>
  <a href="#" class="w3-button w3-hover-teal">&raquo;&raquo;</a>
</div>
</div>
-->
<script>

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
    var page = ((range - 2) * rangeSize) + 1;
    var range = range - 1;
    var url = "${pageContext.request.contextPath}/app/co/list";
    url = url + "?page=" + page;
    url = url + "&range=" + range;

    location.href = url;
  }

  //페이지 번호 클릭
  function fn_pagination(page, range, rangeSize, searchType, keyword) {
    var url = "${pageContext.request.contextPath}/app/co/list";
    url = url + "?page=" + page;
    url = url + "&range=" + range;

    location.href = url;  
  }

  //다음 버튼 이벤트
  function fn_next(page, range, rangeSize) {
    var page = parseInt((range * rangeSize)) + 1;
    var range = parseInt(range) + 1;
    var url = "${pageContext.request.contextPath}/app/co/list";
    url = url + "?page=" + page;
    url = url + "&range=" + range;

    location.href = url;
  }
</script>

 
  <div class="paginationBox">
    <div style="
    display: table; margin: auto;">
    <ul class="pagination" >
      <c:if test="${pagination.prev}">
        <li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
      </c:if>
        
      <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
        <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
        <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
      </c:forEach>

      <c:if test="${pagination.next}">
        <li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
      </c:if>
    </ul>
    </div>
  </div>






<br>
<br>

<jsp:include page="../footer.jsp" />
