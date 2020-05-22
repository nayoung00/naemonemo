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
          <form action='search' method='get' enctype='multipart/form-data'>
          기간별 조회 : <input name='startDate' type='date'> ~ <input name='endDate' type='date'>
          <button>검색</button>
          </form>
          
          <div class="content table-responsive table-full-width">
          
          
          
          <div class="container">
            <table class="table table-hover">
              <thead>
                <th style="width: 10%">회계번호</th>
                <th style="width: 10%">모임계좌아이디</th>
                <th style="width: 10%">회계유형명</th>
                <th style="width: 10%">거래일</th>
                <th style="width: 10%">거래처</th>
                <th style="width: 10%">비고</th>
                <th style="width: 10%">입금</th>
                <th style="width: 10%">출금</th>
                <th style="width: 10%">잔액</th>
                <th style="width: 10%">영수증사진</th>
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
</style>
