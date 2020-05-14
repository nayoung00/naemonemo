<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<div style="border:1px solid white; float: left;">
  <p><a href="list">모임 계좌 조회</a></p>
  <p>일별 사용 내역(예정)</p>
  <p>월별 사용 내역(예정)</p>
  <p>회비 내역(예정)</p>
  <p>후원금(예정)</p>
  <p><a href="bankList">계좌 추가/제거</a></p>
</div>
<div style="text-align: center; margin: 0 auto;">
  <h1>계좌 추가/제거</h1>
  <table border='1' style="margin:auto;">
  <tr>
    <th>모임계좌아이디</th>
    <th>계좌번호</th>
    <th>은행명</th>
    <th>기초잔액</th>
    <th>예금주</th>
    
  </tr>
  
  <tbody id="my-tbody"></tbody>
  
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
    <form action="bankForm" method="post">
<div id="t_space">
<input type="button" value="계좌 추가" onclick="add_row()">


    <script type="text/javascript" id="numberOnly">

  function add_row() {
    var my_tbody = document.getElementById('my-tbody');
     // var row = my_tbody.insertRow(0); // 상단에 추가
    var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    cell1.innerHTML = "<input type='text' name='bankForm' width='20px'/>";
    cell2.innerHTML = "<input type='text'/>";
    cell3.innerHTML = "<input type='text'/>";
    cell4.innerHTML = "<input type='text'/>";
    cell5.innerHTML = "<input type='text'/>";
  }

  function delete_row() {
    var my_tbody = document.getElementById('my-tbody');
    if (my_tbody.rows.length < 1) return;
    // my_tbody.deleteRow(0); // 상단부터 삭제
    my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
  }
</script>
</div>
</form>
    <br>
</div>

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
<jsp:include page="../footer.jsp"/>
    