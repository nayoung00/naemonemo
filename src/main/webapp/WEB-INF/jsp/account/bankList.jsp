<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">


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
<div style="text-align: center; margin: 0 auto;">
	<h1>계좌 추가/제거</h1>
	<form action='bankAdd' method='post' enctype='multipart/form-data'>
		<div>
			<table border='1' style="margin: auto;">
				<tr>
					<th>모임계좌아이디</th>
					<th>모임번호</th>
					<th>계좌번호</th>
					<th>은행명</th>
					<th>기초잔액</th>
					<th>예금주</th>

				</tr>
				<tbody id="bankbody"></tbody>


				<c:forEach items="${bankList}" var="item">
					<tr>
						<td>${item.bankInfoId}</td>
						<td>${item.groupNo}</td>
						<td>${item.bankAccountNo}</td>
						<td>${item.bankName}</td>
						<td>${item.openingBalance}</td>
						<td>${item.bankAccountHolder}</td>

					</tr>
				</c:forEach>
			</table>

			<input type="button" value="계좌 추가" onclick="add_row()"> <input
				type="submit" value="저장하기">
		</div>
	</form>
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
		var cell6 = row.insertCell(5);

		cell2.innerHTML = "<input name='groupNo' type='text' value='1'>";
		cell3.innerHTML = "<input type='text' name='bankAccountNo' value=''>";
		cell4.innerHTML = "<input type='text' name='bankName' value=''>";
		cell5.innerHTML = "<input type='text' name='openingBalance' value=''>";
		cell6.innerHTML = "<input type='text' name='bankAccountHolder' value=''>";
	};

	// 미적용
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




<br>
<br>
<hr>
<div style="text-align: center; margin: 0 auto;">
	<form action='search' method='get'>
		검색어: <input name='keyword' type='text'>
		<button>검색</button>
	</form>
</div>
<br>
