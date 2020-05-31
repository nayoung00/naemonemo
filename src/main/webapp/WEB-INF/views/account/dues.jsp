<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<div class="wrapper">
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="card">
									<c:forEach items="${dues}" var="item">
						<div class="header text-center">
							<h4 class="title">회비 안내 : ${item.groupName}</h4>
							<p class="category">모임에서 설정한 회비는 아래와 같습니다.</p>
							<br>
						</div>
						<div
							class="content table-responsive table-full-width table-upgrade">
							<table class="table">
								<thead>
									<th></th>
									<th class="text-center">Check</th>
									<th class="text-center">How</th>
								</thead>
								<tbody>
										<tr class="text-center">
											<td>입회비</td>
											<td><i class="fa fa-check text-success"></i></td>
											<td>${item.entranceFee}</td>
										</tr>
										<tr class="text-center">
											<td>회비 납부 주기</td>
											<td><i class="fa fa-check text-success"></i></td>
											<td>${item.duesPeriod}</td>
										</tr>
										<tr class="text-center">
											<td>회비 설정 금액</td>
											<td><i class="fa fa-check text-success"></i></td>
											<td>${item.dues}</td>
										</tr>
										<tr class="text-center">
											<td>계좌</td>
											<td>${item.bankName}</td>
											<td>${item.bankAccountNo}</td>
										</tr>
									<tr class="text-center">
										<td colspan="3"><a
											href="updateDuesForm?groupNo=${item.groupNo}">
												<button class="btn btn-round btn-fill btn-info">
													수정하기</button>
										</a></td>
									</tr>
									
								</tbody>
							</table>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<style>
.col-md-8 col-md-offset-2 {
	margin: auto;
	overflow: auto;
}
</style>
</html>