<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<div style="border: 1px solid white; float: left;">
	<p>
		<a href="list">모임 계좌 조회</a>
	</p>
	<p>일별 사용 내역(예정)</p>
	<p>월별 사용 내역(예정)</p>
	<p>회비 내역(예정)</p>
	<p>후원금(예정)</p>
	<p>
		<a href="bankList">계좌 추가/제거</a>
	</p>
</div>


<!--content-->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
						<h1 class="title">모임 계좌 조회</h1>
					</div>
					<div class="content table-responsive table-full-width">
						<table class="table table-hover">
							<thead>
								<th style="width: 10%">회계번호</th>
								<th style="width: 10%">모임계좌아이디</th>
								<th style="width: 10%">회계유형명</th>
								<th style="width: 10%">입금</th>
								<th style="width: 10%">출금</th>
								<th style="width: 10%">거래일</th>
								<th style="width: 10%">거래처</th>
								<th style="width: 10%">비고</th>
								<th style="width: 10%">영수증사진</th>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="item">
									<tr>
										<td>${item.accountNo}</td>
										<td>${item.bankInfoId}</td>
										<td>${item.accountTypeName}</td>
										<td>${item.deposit}</td>
										<td>${item.withdraw}</td>
										<td>${item.paymentDate}</td>
										<td>${item.accountConnection}</td>
										<td>${item.remarks}</td>
										<td><a href='updatePhotoForm?accountNo=${item.accountNo}'>${item.receiptPhoto}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
	<a href='form' style="float: right; margin-right: 200px;">사용내역 추가</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--
<div style="text-align: center; margin: 0 auto;"> 
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>
</div>
-->
</div>
