<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>모임 상세정보</h1>

<form action="addgrmember" method="GET">
<input type="hidden" name="groupNo" value="${group.groupNo}"/>
<input type="hidden" name="memberNo" value="${loginUser.no}"/>
<input type="hidden" name="gradeNo" value="1"/>
<button id="addGrMember" type="button"  onclick="popup()">가입하기</button>
</form>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  가입 신청
</button>


<form action="../grmember/search" method="GET">
    <input type="text" name="memberNo" placeholder="검색할 회원 번호"/>
    <input type="submit" value="전송"/>
</form>

<c:if test="${empty loginUser}">
<p>로그인 해야 가입가능합니다.</p>
<a href="${pageContext.servletContext.contextPath}/app/auth/login"><button>로그인</button></a>
</c:if>
<c:if test="${not empty group}">
<form>
<c:if test='${not empty group.groupPhoto}'>
<img src='${pageContext.servletContext.contextPath}/upload/group/${group.groupPhoto}' height='80'><br>
</c:if>
<c:if test='${empty group.groupPhoto}'>
<img src='https://via.placeholder.com/150'>
</c:if>
<p>번호: ${group.groupNo}</p>
<p>이름:${group.groupName}</p>
<p>소개: ${group.groupInfo}</p>
<p>형태: ${group.groupForm}</p>
<p>관심사: ${group.groupInterest}</p>
<input type='text' id='resizable' >
사진: <input name='photoFile' readonly type='file' value='${group.groupPhoto}'><br>
<span class='group_region'>지역: <input type='text' style='width:550px;' id='address' value='${group.city}'></span>
<div id="map" style="width:300px;height:200px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72ccb0849c4c5a8e44c4774f8f03594c&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var region_address_length = document.getElementById("address").value.length;

// 주소로 좌표를 검색합니다
geocoder.addressSearch(document.getElementById("address").value, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">집</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<p>생성일: ${group.createDate}</p>
<p><a href='updateForm?no=${group.groupNo}'>변경</a>
<a href='delete?no=${group.groupNo}'>삭제</a></p>
</form>
</c:if>
<c:if test="${empty group}">
<p>해당  모임이 없습니다.</p>
</c:if>

<script type="text/javascript">
$(document).ready(function() {     
    $('#exampleModal').on('show.bs.modal', function(event) {          
        var seq = $(event.relatedTarget).data('id');
    });
});
    </script>



