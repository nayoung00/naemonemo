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
            <h3 class="title">모임 회원 관리</h3>
          </div>

          <div class="content table-responsive table-full-width">
            <div class="container">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th style="width: 10%" class='fixedHeader'></th>
                    <th style="width: 10%" class='fixedHeader'>회원등급</th>
                    <th style="width: 10%" class='fixedHeader'>이름</th>
                    <th style="width: 10%" class='fixedHeader'>닉네임</th>
                    <th style="width: 10%" class='fixedHeader'>생일</th>
                    <th style="width: 10%" class='fixedHeader'>가입상태</th>
                    <th style="width: 10%" class='fixedHeader'>회비 미납 여부</td>                  
                  </tr>
  
                </thead>
                <tbody>
                  <c:forEach items="${list}" var="item">
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
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
  background-color: #F2F2F2;
  position: sticky;
  color: white;
  top: 0;
  opacity: 1;
}

</style>

<!-- 기간 검색 유효성 검사 -->
