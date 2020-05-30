<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<div class="wrapper">
  <div class="main-panel">
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <div class="card">
              <div class="header text-center">
                <h4 class="title">회비 안내 : [모임 이름]</h4>
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
                      <td><i class="fa fa-times text-danger">
                      <input name='entranceFee' type='checkbox' value='${dues.entranceFee}'></i></td>
                      <td>[설정금액]</td>
                    </tr>
                    <tr class="text-center">
                      <td>회비 납부 주기</td>
                      <td><i class="fa fa-check text-success"></i></td>
                      <td>[연 1회/ 월 1회 / 주 1회 / 직접입력] 선택</td>
                    </tr>
                    <tr class="text-center">
                      <td>회비 설정 금액</td>
                      <td><i class="fa fa-check text-success"></i></td>
                      <td>[설정금액]</td>
                    </tr>
                    <tr class="text-center">
                      <td>계좌</td>
                      <td>[은행명]</td>
                      <td>[계좌번호]</td>
                    </tr>
                    <tr class="text-center">
                      <td colspan="3"><button 
                        class="btn btn-round btn-fill btn-info">수정하기</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <input name='groupNo' type='hidden' value='${group.groupNo}'>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</html>