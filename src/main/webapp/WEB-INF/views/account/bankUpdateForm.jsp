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

					<form action='bankUpdate' method='post'
						enctype='multipart/form-data'>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover">
								<thead>
									<th style="width: 10%"></th>
									<th style="width: 10%">계좌번호</th>
									<th style="width: 10%">은행명</th>
									<th style="width: 10%">예금주</th>
								</thead>
								<tbody id="bankbody">
									<tr>
										<td><input type='checkbox' name='chkBox'></td>
										<td><input type='text' name='bankAccountNo'
											value='${groupAccount.bankAccountNo}'></td>
										<td><input type='text' name='bankName'
											value='${groupAccount.bankName}'></td>
										<td><input type='text' name='bankAccountHolder'
											value='${groupAccount.bankAccountHolder}'></td>
									</tr>
								</tbody>
							</table>
							<span style="float:left"><input type="button" value="계좌 추가" onclick="add_row()"></span> 
							<span style="float:left"><input type="button" value="계좌 삭제" onclick="delete_row()"></span> 
              <button>저장하기</button>
							<!-- <span style="float:right"><input type="submit" value="저장하기"></span> -->
						</div>
						<input type='hidden' readonly name='bankInfoId' value='${groupAccount.bankInfoId}'> 
						<input type='hidden' readonly name='groupNo' value='${groupAccount.groupNo}'>
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
		let row = bankbody.insertRow(0); // 상단에 추가
		let rowCnt = bankbody.rows.length;

		if (rowCnt == 0 || rowCnt == null) {
			// var row = bankbody.insertRow( my_tbody.rows.length ); // 하단에 추가
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);

			cell1.innerHTML = "<input type='checkbox'  name='chkBox'>";
			cell2.innerHTML = "<input type='text' name='bankAccountNo' value=''>";
			cell3.innerHTML = "<input type='text' name='bankName' value=''>";
			cell4.innerHTML = "<input type='text' name='bankAccountHolder' value=''>";
			rowCnt++;  
		} else {
			alert("계좌는 하나만 등록 가능합니다.");
		}
	};

	function delete_row() {
		var table = document.getElementById("bankbody");

		let rowCnt = table.rows.length;

		for (var i = 0; i < rowCnt; i++) {
			let row = table.rows[i];
			let chkBox = row.cells[0].childNodes[0];
			if (chkBox != null && chkBox.checked == true) {
				table.deleteRow(i);
				rowCnt--;
				i--;
			} else {
				alert("삭제할 계좌가 존재하지 않습니다.");
			}
		}
		  
	};
</script>
<style>
.row {
	width: 879px;
	margin: auto;
}
.col-md-12 {
height: 400px;
}
.card card-plain {
height: 400px;
}
</style>