<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

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
</head>
<body>
<jsp:include page="../header.jsp" />

<!-- 회원가입 양식 -->

    <div class="row">
        <div class="offset-md-2 col-md-4">
            <div class="card" style="width:200%;">
                <div class="card-header text-white" style="background: #343A40;">
                    <h2><span style="color: gray;">nmnm</span> 회원 가입</h2>
                </div>
                <div class="card-body">
                
                    <form action="join" name="signup" id="signUpForm" method="post" enctype='multipart/form-data'
                        style="margin-bottom: 0;">
                        
                        
                    <div class="box" style="background: #BDBDBD;">
                         <img  class="profile" id="blah" src="#"/>
                    </div>
                                <input type="file" name="photoFile" id="form1" onchange="readURL(this);"
                                    required="required" aria-required="true">
                           
                        
                        <input type="hidden" name="auth" value="common">
                        
                        <table
                            style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                             <tr>
                                <td style="text-align: left"><br>
                                    <p><strong>이메일을 입력해주세요.
                                <input type='button' id='idck' value="email중복확인" onclick='checkid()'>
                                    </strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
                                </td>
                                
                            </tr>
                            <tr>
                                <td><input type="text" name="email" id="email" 
                                    class="form-control tooltipstered" 
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="ex) nmnm@test.com"></td>
                            </tr> 
            
                            <tr>
                                <td style="text-align: left">
                                    <p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="password" size="17" maxlength="20" id="password"
                                    name="password" class="form-control tooltipstered" 
                                    maxlength="20" required="required" aria-required="true"
                                    style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="영문과 특수문자를 포함한 최소 8자"></td>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="password" size="17" maxlength="20" id="password_check"
                                    name="pw_check" class="form-control tooltipstered" 
                                    maxlength="20" required="required" aria-required="true"
                                    style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="비밀번호가 일치해야합니다."></td>
                            </tr>
            
                            <tr>
                                <td style="text-align: left">
                                    <p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" name="name" id="user_name"
                                    class="form-control tooltipstered" maxlength="5"
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="이름"></td>
                            </tr>
                            <tr>
                                 <td style="text-align: left">
                                    <p><strong>닉네임을 입력해주세요.
                                     <input type='button' id='nickck' value="중복확인" onclick='checknick()'>
                                    </strong>&nbsp;&nbsp;&nbsp;<span id="nicChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" name="nickname" id="nickname" 
                                    class="form-control tooltipstered" maxlength="20"
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="nickname"></td>
                                    
                            </tr>
                          
                            <tr>
                                 <td style="text-align: left">
                                    <p><strong>생일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="telChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="date" name="birthday" id="birthday"
                                    class="form-control tooltipstered" maxlength="20"
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"></td>
                            </tr>
                              <tr>
                                 <td style="text-align: left">
                                    <p><strong>관심사항을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="telChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" name="interest" id="interest"
                                    class="form-control tooltipstered" maxlength="20"
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="ex) 맛집탐방"></td>
                            </tr>
                            <tr>
                                 <td style="text-align: left">
                                    <p><strong>한줄소개를 해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="telChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" name="intro" id="intro"
                                    class="form-control tooltipstered" maxlength="20"
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 100px; border: 1px solid #d9d9de"
                                    ></td>
                            </tr>
                            <tr>
                                 <td style="text-align: left">
                                    <p><strong>sns를 입력 해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="telChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" name="sns" id="sns"
                                    class="form-control tooltipstered" maxlength="20"
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                    ></td>
                            </tr>
                            
                             
                            <tr>
                                <td style="width: 100%; text-align: center; colspan: 2;">
                                <input
                                    type="button" value="회원가입" 
                                    class="btn form-control tooltipstered" id="signup-btn"
                                    style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                                </td>
                            </tr>
            
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

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




<script type="text/javascript">
function checkid(){
     $.ajax({
       type: 'POST',
       datatype: "json",
       data: {email : $("#email").val()},
       url: "checkid",
       success : function(result){
           if (result == 0){
               console.log("넘어온 값 : " + result);
               alert('사용가능합니다');
           } else {
               idck = 1;
             console.log("넘어온 값 : " + result);
               alert('중복입니다');
           }
       }
       });
     };
     
     function checknick(){
         $.ajax({
           type: 'POST',
           datatype: "json",
           data: {nickname : $("#nickname").val()},
           url: "checknick",
           success : function(result){
               if (result == 0){
                   console.log("넘어온 값 : " + result);
                   alert('사용가능합니다');
               } else {
                   nickck = 1;
                 console.log("넘어온 값 : " + result);
                   alert('중복입니다');
               }
           }
           });
         };

 
</script>



<script>
//start JQuery
$(function() {
    
    //입력값 검증 정규표현식
    const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
    const getName= RegExp(/^[가-힣]+$/);
    //입력값 검증을 마칠 경우 true로 설정 
    //(chk2 : 비번, chk3: 비번확인란, chk4: 이름, chk5: 이메일)
    let chk2 = false, chk3 = false, chk4 = false;
    
    //회원가입 form DOM객체 저장.
    const regForm = $("#signUpForm");
    
    //패스워드 입력값 검증.
    $('#password').on('keyup', function() {
        //비밀번호 공백 확인
        if($("#password").val() === ""){
            $('#password').css("background-color", "pink");
            $('#pwChk').html('<b style="font-size:14px;color:red;">[비밀번호를 입력해주세요.]</b>');
            chk2 = false;
        }                
        //비밀번호 유효성검사
        else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
            $('#password').css("background-color", "pink");
            $('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
            chk2 = false;
        } else {
            $('#password').css("background-color", "#b3ffb3");
            $('#pwChk').html('<b style="font-size:14px;color:green;"></b>');
            chk2 = true;
        }
        
    });
    
    //패스워드 확인란 입력값 검증.
    $('#password_check').on('keyup', function() {
        //비밀번호 확인란 공백 확인
        if($("#password_check").val() === ""){
            $('#password_check').css("background-color", "pink");
            $('#pwChk2').html('<b style="font-size:14px;color:red;">[비밀번호를 확인해주세요.]</b>');
            chk3 = false;
        }                
        //비밀번호 확인란 유효성검사
        else if($("#password").val() != $("#password_check").val()){
            $('#password_check').css("background-color", "pink");
            $('#pwChk2').html('<b style="font-size:14px;color:red;">[비밀번호가 일치하지 않습니다.]</b>');
            chk3 = false;
        } else {
            $('#password_check').css("background-color", "#b3ffb3");
            $('#pwChk2').html('<b style="font-size:14px;color:green;"></b>');
            chk3 = true;
        }
        
    });
    
    //이름 입력값 검증.
    $('#user_name').on('keyup', function() {
        //이름값 공백 확인
        if($("#user_name").val() === ""){
            $('#user_name').css("background-color", "pink");
            $('#nameChk').html('<b style="font-size:14px;color:red;">[이름을 입력해주세요.]</b>');
            chk4 = false;
        }                
        //이름값 유효성검사
        else if(!getName.test($("#user_name").val())){
            $('#user_name').css("background-color", "pink");
            $('#nameChk').html('<b style="font-size:14px;color:red;">[한글만 입력가능합니다.]</b>');
            chk4 = false;
        } else {
            $('#user_name').css("background-color", "#b3ffb3");
            $('#nameChk').html('<b style="font-size:14px;color:green;"></b>');
            chk4 = true;
        }
        
    });
    
    //회원가입 버튼 클릭 이벤트
    $('#signup-btn').click(function() {
        if(chk2 && chk3 && chk4) {
            regForm.submit(); //서버로 폼전송
        } else {
            alert("입력정보를 다시 확인하세요!");
        }
    });
    
});//end JQuery

</script>
    


   <!--      <div class="input-group-over">
                            <div class="form-label-group mb-3">
                                <input required placeholder="이메일*" name="email" type="email"
                                    class="form-control" /> <label for="account_email">이메일</label>
                            </div>
                            <a id="email_edit_show" href="javascript:;" class="btn fs--13"
                                onclick="jQuery('#account_email').attr('readonly', false); jQuery('#email_edit_show, #email_edit_info').addClass('hide'); jQuery('#email_edit_hide, #email_edit_info').removeClass('hide');jQuery('#account_email').val('').focus();">
                                <i class="fi fi-pencil m-0"></i>
                            </a> <a id="email_edit_hide" href="javascript:;"
                                class="btn fs--12 hide"
                                onclick="jQuery('#account_email').attr('readonly', true); jQuery('#email_edit_show, #email_edit_info').removeClass('hide'); jQuery('#email_edit_hide, #email_edit_info').addClass('hide'); jQuery('#account_email').val('john.doe@gmail.com');">
                                <i class="fi fi-close m-0"></i>
                            </a>
                        </div>
                        <div id="email_edit_info" class="mt-1 mb-4 fs--13 text-muted hide">회원가입
                            후 해당 이메일로 이메일 인증을 진행 해 주세요.</div> -->

</body>
</html>