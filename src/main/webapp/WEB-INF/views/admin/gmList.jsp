<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script src="https://code.jquery.com/jquery-latest.js"></script>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<html>
  <body>
    <script>
      function confirmModal() {
        if(window.confirm("가입을 승인하시겠습니까?")){
        	$("td:last-child:contains('승인신청')").text('승인완료').css("color","black").css("font-weight", "normal").parent().css("background", "#dee2e6");
        } else {
          console.log("취소. 변화 없음");
        }
      }
    </script>
  </body>
</html>

<!--content-->
  <div class="container-fluid">
    <div class="row">
            <h3 class="title" style="text-align: center">모임 회원 관리</h3><br>
          </div>

          <div class="content table-responsive table-full-width">
            <div class="container">
              <table id="#example-table-1" class="table table-bordered table-hover">
                <thead>
                  <tr >
                    <th style="width: 10%; text-align: center;"  class='fixedHeader'>No</th>
                    <th style="width: 10%; text-align: center;" class='fixedHeader'>UserName</th>
                    <th style="width: 10%; text-align: center;" class='fixedHeader'>NickName</th>
                    <th style="width: 10%; text-align: center;" class='fixedHeader'>Email</th>
                    <th style="width: 10%; text-align: center;" class='fixedHeader'>Birthday</th>
                    <th style="width: 10%; text-align: center;" class='fixedHeader'>State</th>
                  </tr>
  
                </thead>
                <tbody>
                  <c:forEach items="${list}" var="item">
                    <tr onclick="confirmModal()" style="width: 10%; text-align: center;" >
                      <td>${item.regNo}</td>
                      <td>${item.name}</td>
                      <td>${item.nickname}</td>
                      <td>${item.email}</td>
                      <td>${item.birthday}</td>
                      <td>${item.register}</td>
                    </tr>
                  </c:forEach>
                  </tbody>
              </table>
            </div>
          </div>
        </div>

<script>
$("td:last-child:contains('승인완료')").parent().css("background", "#dee2e6");
$("td:last-child:contains('승인신청')").css("color","red").css("font-weight", "bold");
$("td:last-child:contains('탈퇴')").parent().css("color","#778899");
</script>



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


}
</style>




<!-- 기간 검색 유효성 검사 -->