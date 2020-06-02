<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">



<!--content-->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-plain">
					<div class="header">
						<h3>계좌 추가/제거</h3>
					</div>
					<form action='bankUpdate' method='post' enctype='multipart/form-data'>
						<div class="content table-responsive table-full-width">
									<c:forEach items="${bankList}" var="item">
								<a href="bankUpdateForm?groupNo=${item.groupNo}">편집</a>
							<table class="table table-hover">
								<thead>
									<th style="width: 10%">No</th>
									<th style="width: 10%">계좌번호</th>
									<th style="width: 10%">은행명</th>
									<th style="width: 10%">예금주</th>
								</thead>
								<tbody id="bankbody">


										<tr>
											<td>${item.bankInfoId}</td>
											<td>${item.bankAccountNo}</td>
											<td>${item.bankName}</td>
											<td>${item.bankAccountHolder}</td>
										</tr>
								</tbody>
							</table>
									</c:forEach>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
</div>
<style>
.row {
width: 879px;
margin: auto;
}
</style>