<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<!-- 
 <h1>회계 입력</h1>
<form action='add' method='post' enctype='multipart/form-data'>
모임번호: <input name='groupNo' type='text' value='1'><br> 
모임계좌아이디: <input name='bankInfoId' type='text' value='1'><br> 
회계유형명: <input name='accountTypeName' type='text' value='ex) 회의비'><br>
입금: <input name='deposit' type='text' value='0'><br>
출금: <input name='withdraw' type='text' value='0'><br>
거래일: <input name='paymentDate' type='date'><br>
거래처: <input name='accountConnection' type='text'><br>
비고: <input name='remarks' type='text'><br>
영수증사진: <input name='receiptPhotoFile' type='file'><br>

<input type='submit' value='upload'/><br>

</form>
 -->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<div class="header">
						<h4 class="title">사용 내역 입력</h4>
					</div>
					<div class="content">
						<form action='add' method='post' enctype='multipart/form-data'>
							<input name='groupNo' type='hidden' value='1'>
							<input name='bankInfoId' type='hidden' value='1'>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>계정과목</label> <input name='accountTypeName' type='text'
											class="form-control" placeholder='ex) 회의비'>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2">
									<div class="form-group">
										<label>입금액</label> <input name='deposit' type='text'
											class="form-control">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>출금액</label> <input name='withdraw' type='text'
											class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>거래일</label> <input name='paymentDate' type='date'
											class="form-control" placeholder='날짜'>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>거래처</label> <input name='accountConnection' type='text'
											class="form-control" placeholder='거래처'>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>비고</label> <input name='remarks' type='text'
											class="form-control" placeholder='비고'>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>영수증사진</label> <input name='receiptPhotoFile'
											type='file' class="form-control">
									</div>
									<br>
									<button type='submit' class="btn btn-info btn-fill">등록하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
