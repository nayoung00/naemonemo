<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!--content-->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
							<h3>포럼</h3>
							<a href='form'>새 글</a>
					</div>
					
					<div class="content table-responsive table-full-width">
						<br>
						<table class="table table-hover">
							<thead>
								<th style="width: 10%">번호</th>
								<th style="width: 10%">글 분류</th>
								<th style="width: 10%">회원번호</th>
								<th style="width: 50%">제목</th>
								<th style="width: 10%">작성일</th>
								<th style="width: 10%">조회수</th>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="item">
									<tr>
										<td>${item.coNo}</td>
										<td>${item.category}</td>
										<td>${item.memberNo}</td>
										<td><a href='detail?coNo=${item.coNo}'> ${item.title}</a></td>
										<td>${item.createDate}</td>
										<td>${item.viewCount}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<hr>
	<div style="text-align: center; margin: 0 auto;">
		<form action='search' method='get'>
			검색어: <input name='keyword' type='text'>
			<button class="w3-button w3-round-large w3-teal w3-small">검색</button>
		</form>
	</div>
	<br>

	<div class="paginationBox">
		<div style="display: table; margin: auto;">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
							${idx} </a>
					</li>
				</c:forEach>

				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.range}', 
'${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.getContextPath()}/app/co/list";
		url = url + "?page=" + page;

		location.href = url;
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${pageContext.request.getContextPath()}/app/co/list";
		url = url + "?page=" + page;

		location.href = url;
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.getContextPath()}/app/co/list";
		url = url + "?page=" + page;

		location.href = url;
	}
</script>