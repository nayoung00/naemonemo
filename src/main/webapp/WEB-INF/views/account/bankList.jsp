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
						<h1>계좌 추가/제거</h1>
					</div>
					<form action='bankAdd' method='post' enctype='multipart/form-data'>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover">
								<thead>
									<th style="width: 10%">모임계좌아이디</th>
									<th style="width: 10%">모임번호</th>
									<th style="width: 10%">계좌번호</th>
									<th style="width: 10%">은행명</th>
									<th style="width: 10%">예금주</th>
								</thead>
								<tbody id="bankbody">


									<c:forEach items="${bankList}" var="item">
										<tr>
											<td>${item.bankInfoId}</td>
											<td>${item.groupNo}</td>
											<td>${item.bankAccountNo}</td>
											<td>${item.bankName}</td>
											<td>${item.bankAccountHolder}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<input type="button" value="계좌 추가" onclick="add_row()"> <input
								type="submit" value="저장하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
</div>


<script type="text/javascript">
	function add_row() {
		var bankbody = document.getElementById('bankbody');
		var row = bankbody.insertRow(0); // 상단에 추가
		// var row = bankbody.insertRow( my_tbody.rows.length ); // 하단에 추가
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		var cell5 = row.insertCell(4);

		cell2.innerHTML = "<input name='groupNo' type='text' value='1'>";
		cell3.innerHTML = "<input type='text' name='bankAccountNo' value=''>";
		cell4.innerHTML = "<input type='text' name='bankName' value=''>";
		cell5.innerHTML = "<input type='text' name='bankAccountHolder' value=''>";
	};

	function delete_row() {
		var table = document.getElementById("reqList");

		var rowCnt = table.rows.length;

		for (var i = 0; i < rowCnt; i++) {
			var row = table.rows[i];
			var chkBox = row.cells[0].childNodes[0];
			if (chkBox != null && chkBox.checked == true) {
				table.deleteRow(i);
				rowCnt--;
				i--;
			}
		}
	};
</script>
