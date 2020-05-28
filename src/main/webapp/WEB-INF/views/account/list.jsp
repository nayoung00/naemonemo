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
						<h4 class="title">모임 계좌 조회</h4>
					</div>
					<div class="searchDate">
					<form action='search' method='get' enctype='multipart/form-data'>
					<div class="searchDateBox">
					· 기간별 조회 : <input id='startDate' name='startDate' type='date'>
					 ~ <input id='endDate' name='endDate' type='date'>
					<button id='submit_date'>검색</button>
					</div>
					</form>
					</div>
					
					<div class="content table-responsive table-full-width">
					
					
					
					<div class="container">
						<table class="table table-hover" >
							<thead>
								<th style="width: 10%" class='fixedHeader'>회계번호</th>
								<th style="width: 10%" class='fixedHeader'>모임계좌아이디</th>
								<th style="width: 10%" class='fixedHeader'>회계유형명</th>
								<th style="width: 10%" class='fixedHeader'>거래일</th>
								<th style="width: 10%" class='fixedHeader'>거래처</th>
								<th style="width: 10%" class='fixedHeader'>비고</th>
								<th style="width: 10%" class='fixedHeader'>입금</th>
								<th style="width: 10%" class='fixedHeader'>출금</th>
								<th style="width: 10%" class='fixedHeader'>잔액</th>
								<th style="width: 10%" class='fixedHeader'>영수증사진</th>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="item">
									<tr>
										<td>${item.accountNo}</td>
										<td>${item.bankInfoId}</td>
										<td>${item.accountTypeName}</td>
										<td>${item.paymentDate}</td>
										<td>${item.accountConnection}</td>
										<td>${item.remarks}</td>
										<td>${item.deposit}</td>
										<td>${item.withdraw}</td>
										<td>${item.endingBalance}</td>
										<td><a href='updatePhotoForm?accountNo=${item.accountNo}'>${item.receiptPhoto}</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
</div>
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
<style>

  .container {
    width: 1000px;
    height: 500px;
    overflow: auto;
  }
  .container::-webkit-scrollbar {
    width: 10px;
  }
  .container::-webkit-scrollbar-thumb {
    background-color: #777e8c;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .container::-webkit-scrollbar-track {
    background-color: lightgrey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
  .fixedHeader {
  background-color : #F2F2F2;
  position: sticky;
    color:white;
  top: 0;
  opacity: 1;
  }
  
  
  
  
  
  
  <!-- 기간검색 -->
  .searchDate {
  background-color: lightgray;
      border-radius: 10px;
      width: 800px;
      height: 40px;
      margin: auto;
      text-align: center;
      color: black;
      font-size: 15px;
  }
  .searchDateBox {
      display:table-cell;
    vertical-align:middle;
  }
</style>

<!-- 기간 검색 유효성 검사 -->
<script>
 function searchDateform() {
	var start = $('#startDate').val();
	var end = $('#endDate').val();
	if (start == null || start == "") {
    alert("시작 기간을 입력해주세요!");
    return false;
  }
  if (end == null || end == "") {
    alert("종료 기간을 입력해주세요!");
    return false;
  }
 }
 $(function() {
  $(document).on("click", "#submit_date", function(e) {
    if (searchDateform() == false) {
      e.preventDefault();
      document.getElementById("startDate").value = $('#startDate').val();
      document.getElementById("endDate").value = $('#endDate').val();
    }
  });
});
</script>
<!-- 
<script>
$("#search").click(function(){
    
    var startDate = $( "input[name='startDate']" ).val();
    var startDateArr = startDate.split('-');
     
    var endDate = $( "input[name='endDate']" ).val();
    var endDateArr = endDate.split('-');
             
    var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
    var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
     
    if(startDateCompare.getTime() > endDateCompare.getTime()) {
         
        alert("시작날짜와 종료날짜를 확인해 주세요.");
         
        return;
    }
     
    $("#frmSearch").submit();
});

</script>
-->
