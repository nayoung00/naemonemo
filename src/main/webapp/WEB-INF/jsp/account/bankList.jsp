<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<jsp:include page="../header.jsp" />
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
	<table border='1' style="margin: auto;">
		<tr>
			<th>모임계좌아이디</th>
			<th>계좌번호</th>
			<th>은행명</th>
			<th>기초잔액</th>
			<th>예금주</th>

		</tr>

		<tbody id="bankbody"></tbody>

		<c:forEach items="${bankList}" var="item">
			<tr>
				<td>${item.bankInfoId}</td>
				<td>${item.bankAccountNo}</td>
				<td>${item.bankName}</td>
				<td>${item.openingBalance}</td>
				<td>${item.bankAccountHolder}</td>

			</tr>
		</c:forEach>
	</table>
	<form action='bankAdd' method='post' enctype='multipart/form-data' onsubmit="fn_insert()">
		<div>
		<input type="button" value="계좌 추가" onclick="add_row()"> 
		<input type="submit" name="bankbody" value="저장하기">
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

          cell1.innerHTML = "<input type='text' name='bankInfoId' value='3'>";
          cell2.innerHTML = "<input type='text' name='bankAccountNo' value='123123'>";
          cell3.innerHTML = "<input type='text' name='bankName' value='가나다'>";
          cell4.innerHTML = "<input type='text' name='openingBalance' value='123'>";
          cell5.innerHTML = "<input type='text' name='bankAccountHolder' value='가나'>";
          
          
          
        };

        function delete_row() {
          var bankbody = document.getElementById('bankbody');
          if (bankbody.rows.length < 1)
            return;
          bankbody.deleteRow(0); // 상단부터 삭제
          // my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
        };

        function _submit(bankbody) {
          var bankbody = document.getElementById('bankbody');
          if (typeof(bankbody.cell1['bankInfoId'].length) != 'undefined')
          for (i=0; i<bankbody.cell1['bankInfoId'].length; i++) {
            if (bankbody.cell1['bankInfoId'][i]!="") {
            	bankbody.cell1['bankInfoId'][i].disabled=true;
            	bankbody.cell2['${item.bankAccountNo}'][i].disabled=true;
            	bankbody.cell3['bankName'][i].disabled=true;
            	bankbody.cell4['openingBalance'][i].disabled=true;
            	bankbody.cell5['bankAccountHolder'][i].disabled=true;
            }
            
          }
          return true;
        }
        function fn_insert(){ 
          var comSubmit = new comSubmit('bankbody');
          comSubmit.setUrl("<c:url value='/bankAdd' />");  
	                  comSubmit.submit();
        
        }
        
        
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
<jsp:include page="../footer.jsp" />
