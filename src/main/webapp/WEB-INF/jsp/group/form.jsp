<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>모임 생성</h1>
<form name='group_add' action='add' method='post' enctype='multipart/form-data'>
이름: <input name='groupName' type='text'><br>
소개: <input name='groupInfo' type='text'><br>
형태:  <select name='groupForm'>
    <option>온라인
    <option>오프라인
      </select><br>
관심사: <input name='groupInterest' type='text'><br>
사진: <input name='photoFile' type='file'><br>
지역: 
<input type="text" name='city' id="sample5_address" placeholder="주소">
<input type="button" onclick="sample5_execDaumPostcode();" value="주소 검색"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72ccb0849c4c5a8e44c4774f8f03594c&libraries=services"></script>
<script>

function insertGroup() {
	var form = document.group_add;
	
	if (form.groupName.value == "") {
		swal({
			  text: "빈칸이 없도록 입력해 주세요.",
			  icon: "error",
			  button: "닫기",
			});
	}
}

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
</script>

등급 명칭: <input name='gradeName' type='text'/><br/>
<input type='button' value='모임 생성' onclick='insertGroup();'/>
</form>

<jsp:include page="../footer.jsp"/>