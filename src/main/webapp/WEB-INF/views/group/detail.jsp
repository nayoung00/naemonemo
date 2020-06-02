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
    width: 200px;
    height: 200px; 
    border-radius: 70%;
    overflow: hidden;
    margin: 0px auto; 
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
    }

table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
<script>
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
</script>

<section id="blog" class="blog">
  <div class="container">
    <div class="section-header"></div>

    <div class="blog-content">
      <div class="container-fluid">
    
    
<h1>모임 홈</h1>

<br>

<form action="../grmember/addgrmember">
<input type="hidden" name="groupNo" value="${param.groupNo}"/>
<input type="hidden" name="memberNo" value="${loginUser.memberNo }" />
<input type="hidden" name="gradeNo" value="2" />
<button>가입 신청</button>
</form>

<form action="../plan/list">
    <input type="hidden" name="memberNo" value="${loginUser.memberNo}"/>
    <input type="hidden" name="groupNo" value="${param.groupNo}"/>
    <button>일정 게시판</button>
</form>

<c:if test="${empty loginUser}">
<p>로그인 해야 가입가능합니다.</p>
<a href="${pageContext.servletContext.contextPath}/app/auth/login"><button>로그인</button></a>
</c:if>

<div class="box" style="background: #BDBDBD;">
        <img  class="profile" id="blah" src="${pageContext.servletContext.contextPath}/upload/group/${group.groupPhoto}"/>
    </div><br/>
<table style="margin: 0 auto;" class="type03">
    <tr>
        <th scope="row">이름</th>
        <td>${group.groupName}</td>
    </tr>
    <tr>
        <th scope="row">소개</th>
        <td>${group.groupInfo}</td>
    </tr>
    <tr>
        <th scope="row">형태</th>
        <td>${group.groupForm}</td>
    </tr>
        <tr>
        <th scope="row">관심사</th>
        <td>${group.groupInterest}</td>
    </tr>
</table>
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
<p>
<a href = "${pageContext.servletContext.contextPath}/app/moim/home?groupNo=${param.groupNo}">모임입장</a>
</p>

<!-- 모임관리에서 하도록 삭제
<p><a href='updateForm?no=${group.groupNo}'>변경</a>
<a href='delete?no=${group.groupNo}'>삭제</a></p>
 -->

<c:if test="${empty group}">
<p>해당  모임이 없습니다.</p>
</c:if>

</div>
</div>
</section>
