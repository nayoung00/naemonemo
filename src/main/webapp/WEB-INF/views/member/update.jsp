<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 
.row{
   display: grid;
   grid-auto-rows: 30px; 
   grid-template-columns: 160px 160px 160px; /* 명시적 2개 열 정의 */
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

    .update-form{
    display: flex;
     justify-content: center;
     width: 50%;
      height: 100vh;
        background-size: cover
    }
    
     .update-form h1 {
        font-size: 32px; 
        color: #F4A460;
        text-align: center;   
        margin-bottom: 60px; 
        }
        
   .int-area {
    width: 400px; position: relative;
    margin-top:20px;
    }
    .int-area input{
            width: 130%;
            padding: 5px 10px 10px;
           background-color: transparent;
           border: none;
           border-bottom: 1px solid #999;
           font-size: 18px; color:  #000000;
           outline: none;
            }
    .btn-area {margin-top: 30px;}     
    .btn-area button{
        width: 100%; height: 50px;
        background: #F4A460;
        color: #fff;
        font-size: 20px;
        border: none;
        border-radius: 25px;
        }       
    </style>
    
</head>
<body>
 <section class="update-form">
                 <form action="update" method="post" >
            <h1>회원정보 수정</h1>
                  
                   <!--  <div class="box" style="background: #BDBDBD;">
                         <img  class="profile" id="blah" src="#"/>
                    </div>
                                <input type="file" name="photo" id="form1" onchange="readURL(this);"
                                    required="required" aria-required="true">  -->

                           <script src="jquery-3.4.1.js"></script>
                              <div class="int-area">
                      <input  type = "hidden" name='memberNo' readonly value='${loginUser.memberNo}' >
                      </div>
                  <div class="int-area">
                  <label style=" font-size: 13px; color: #F4A460; ">NAME</label>
                    <input type="text" id="name"  name = "name" value="${loginUser.name}">
                     </div> 
                      <div class="int-area">
                  <label style="font-size: 13px; color: #F4A460; ">NICKNAME</label>
                    <input type="text" id="nickname"  name = "nickname" value="${loginUser.nickname}">
                     </div> 
                      <div class="int-area">
                  <label style="font-size: 13px; color: #F4A460; ">BIRTHDAY</label>
                    <input type="date" id="birthday"  name = "birthday" value="${loginUser.birthday}">
                     </div> 
                      <div class="int-area">
                  <label style="font-size: 13px; color: #F4A460; ">INTRO</label>
                    <input type="text" id="intro" name = "intro" placeholder="한줄로 자신을 소개해보세요."value="${loginUser.intro}">
                     </div> 
                  <div class="int-area">
                  <label style="font-size: 13px; color: #F4A460; ">INTEREST</label>
                                                    <div class="checkbox">
                                                    <div class="row">
                                                    <br><br><br><br><br><br><br><hr>
                                                        <input id="checkbox1" type="checkbox" name="interest" value="sports"> 
                                                        <label for="checkbox1">Sports</label>
                                                        <input id="checkbox2" name="interest" value="coding" type="checkbox">
                                                        <label for="checkbox2">Coding</label>
                                                        <input id="checkbox3" name="interest" value="music" type="checkbox">
                                                        <label for="checkbox3">Music</label>
														<input id="checkbox4" type="checkbox" name="interest" value="film"> 
														<label for="checkbox4">Film</label>
														<input id="checkbox5" type="checkbox" name="interest" value="celebrity gossip"> 
														<label for="checkbox5">Celebrity Gossip</label>
														<input id="checkbox6" type="checkbox" name="interest" value="art"> 
														<label for="checkbox6">Art</label>
														<input id="checkbox7" type="checkbox" name="interest" value="philosophy"> 
														<label for="checkbox7">Philosophy</label>
														<input id="checkbox8" type="checkbox" name="interest" value="beer"> 
														<label for="checkbox8">Beer</label>
														<input id="checkbox9" type="checkbox" name="interest" value="wine"> 
														<label for="checkbox9">Wine</label>
														<input id="checkbox10" type="checkbox" name="interest" value="gadgets"> 
														<label for="checkbox10">Gadgets</label>
														<input id="checkbox11" type="checkbox" name="interest" value="gaming"> 
														<label for="checkbox11">Gaming</label>
														<input id="checkbox12" type="checkbox" name="interest" value="politics"> 
														<label for="checkbox12">Politics</label>
														<input id="checkbox13" type="checkbox" name="interest" value="activism"> 
														<label for="checkbox13">Activism</label>
														<input id="checkbox14" type="checkbox" name="interest" value="environmentalism"> 
														<label for="checkbox14">Environmentalism</label>
														<input id="checkbox15" type="checkbox" name="interest" value="cooking"> 
														<label for="checkbox15">Cooking</label>
														<input id="checkbox16" type="checkbox" name="interest" value="crafts"> 
														<label for="checkbox16">Crafts</label> 
                                                    </div> 
                                                    </div>
                        <input type="text" id="interest"  name = "interest" value="${loginUser.interest}">
                   
                     </div> 
                                        <div class="btn-area">
                <button type="submit" value=update>회원 정보 수정</button>
            </div>
                                      </form>
   </section>
   
   <script type="text/javascript">
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
 <script>
function checkboxArr() {
    var checkArr = [];     // 배열 초기화
    $("input[name='interest']:checked").each(function(i)) {
        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    }
 
    $.ajax({
        url: 'update'
        , type: 'post'
        , dataType: 'text'
        , data: {
            valueArrTest: checkArr
        }
    });
}
</script>
 
 
</body>
</html>