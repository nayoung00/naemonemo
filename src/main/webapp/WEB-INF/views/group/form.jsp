<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
h2 { text-align: center; }

.virtual-box {
    margin-bottom: 120px;
}

.box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
    margin: 0px auto; 
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>


<section id="blog" class="blog">
  <div class="container">
   <div class="section-header">
   </div>
    <div class="blog-content">
     <div class="container-fluid">



<form name='addForm' onsubmit="return checkz()" method="post" action="add" enctype="multipart/form-data" > 
<input type="hidden" name="groupAdmin" value="${loginUser.memberNo }"/>
<h2 align="center">모임 생성</h2>
    <div class="box" style="background: #BDBDBD;">
        <img  class="profile" id="blah" src="#"/>
    </div><br/>
   <table id='add_group' align="center" border="3" cellspacing="0">
       <tr>
          <td colspan="5" height="30" align="center" bgcolor=#000000" span style="color:white;">모임기본정보</td>
        </tr>
        <tr> 
          <td align="left">이름</td>
          <td colspan="4"><input type="text" name="groupName" maxlength="12" id="grName" placeholder="이름 " > 4~12자리</td>
       </tr>
    
       <tr>
          <td >소개</td>
           <td colspan="4"><input type="text" name='groupInfo' maxlength="12" id="grInfo" placeholder="모임소개 " > 4~12자리 간단한 모임소개</td>
       </tr>
        <tr>
          <td>형태</td>
          <td colspan="4"><select id='form_check' name='groupForm' id='grForm' >
               <option>온라인
               <option>오프라인
      </select><br>
       </tr>
       <tr class="interest">
          <td align='left'>카테고리</td>
          <td colspan='4'><input type="text" name="groupInterest" id='grInterest' placeholder="카테고리 "></td>
          <!-- <button type="button" class="addBtn">항목추가</button> -->
          <!-- <td colspan='1'><button type="button" class="delBtn">삭제</button></td> -->
        </tr>
        <tr>
          <td>사진</td>
          <td colspan="4"><input type="file" name="photoFile" id="grPhoto" onchange="readURL(this);"
                                    required="required" aria-required="true">
       </tr>
 
       <tr>
          <td algin='left'>지역</td>
          <td colspan='4'>
            <input type="text" name='city' id="sample5_address" style='width: 400px;' placeholder="주소">
            <input type="button" onclick="sample5_execDaumPostcode();" value="주소 검색"><br>
            <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
            </td>
            </tr>
 </table>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script>
// 카테고리 선택 관련 팝업
/* function showPopup() 
{
	window.open("../../group_category/category_popup.html", "a", "width=400, height=300, left=100, top=50");
} */

$(".box").click(function(){
    $("input[name='photoFile']").click();
});

// 이미지 업로드시 나타게
function readURL(input) {
	if (input.files && input.files[0]) {
	var reader = new FileReader();
	reader.onload = function (e) {
	$('#blah').attr('src', e.target.result);
	}
	reader.readAsDataURL(input.files[0]);
	}
	}
            
            // 관심사 항목 추가/삭제
/* var count = 1;
var fullcount = 3;
$(document).ready(function(){
    $(".addBtn").live("click", function(){
        var clickedRow = $(this).parent().parent();
        var cls = clickedRow.attr("class");

        count++;
        if (count > fullcount) {
    		swal({
  			  text: "관심분야는 최대 3개 까지만 가능합니다.",
  			  icon: "error",
  			  button: "닫기",
  			});
    		count = 3;
    		return false;
        } else {
		if (count > 1) {        
        // tr 복사해서 마지막에 추가
        var newrow = clickedRow.clone();
        newrow.find("#grInterest").val("");
        newrow.find("td:eq(0)").remove();
        newrow.insertAfter($("#add_group ."+cls+":last"));

        // rowspan 조정
        resizeRowspan(cls);
        }
       }
    });
     
     
    // 삭제버튼 클릭시
    $(".delBtn").live("click", function(){
    	count--;
    	if (count < 1) {
    		swal({
    			  text: "최소 한 개의 모임 관심분야를 작성해야 합니다.",
    			  icon: "error",
    			  button: "닫기",
    			});
    		count = 0;
    		return false;
    	}
        var clickedRow = $(this).parent().parent();
        var cls = clickedRow.attr("class");
         
        // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
        if( clickedRow.find("td:eq(0)").attr("rowspan") ){
            if( clickedRow.next().hasClass(cls) ){
                clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
            }
        }

        clickedRow.remove();

        // rowspan 조정
        resizeRowspan(cls);
    });
    

    // cls : rowspan 을 조정할 class ex) item1, item2, ...
    function resizeRowspan(cls){
        var rowspan = $("."+cls).length;
        $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
    }
}); */

function checkz() {
    var getIntro = $("#grInfo").val().replace(/\s|/gi,'');
    var getgrInfo = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var getName= RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/);
    var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정

    // 이름 공백 확인
    if($("#grName").val() == ""){
		swal({
			  text: "이름을 입력해 주세요.",
			  icon: "error",
			  button: "닫기",
			});
      $("#grName").focus();
      return false;
    }
    
    // 이름 유효성 검사
   if(!getName.test($("#grName").val())){
		swal({
			  text: "이름을 제대로 입력해 주세요.",
			  icon: "error",
			  button: "닫기",
			});
      $("#grName").val("");
      $("#grName").focus();
      return false;
    } 
    
   //모임소개란 유효성 검사
   //공백이 있다면 안됨.
   if(getIntro==""){
		swal({
			  text: "모임소개 를 입력해주세요.",
			  icon: "error",
			  button: "닫기",
			});
     $("#grInfo").val("");
     $("#grInfo").focus();
     return false;
   }
    
    // 형태 공백 확인
    if($("#grForm").val() == ""){
		swal({
			  text: "형태를 선택해주세요.",
			  icon: "error",
			  button: "닫기",
			});
      $("#grForm").focus();
      return false;
    }

/*     // 관심 분야 유효성 검사
    if(getgrInfo==""){
		swal({
			  text: "관심 분야 제대로 입력해주세요.",
			  icon: "error",
			  button: "닫기",
			});
        $("#grInterest").val("");
        $("#grInterest").focus();
        return false;
      }
 */    
}
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72ccb0849c4c5a8e44c4774f8f03594c&libraries=services"></script>
<script>
// 카카오 맵 관련 api
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
    // 카카오맵 api 끝
</script>
<p align="center">
        <input type="submit" value="모임 생성">
        <input type="reset" value="다시입력">
  </p>
   </form>

</div>
</div>
</div>
</section>