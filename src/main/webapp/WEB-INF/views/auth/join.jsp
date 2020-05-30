<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<style>
 #wrap{
            hight:120px;
            width:530px;
            margin-left:auto; 
            margin-right:auto;
        }

</style>
</head>
<body>

<!-- 회원가입 양식 -->

 <div id="wrap" >
    <div class="row">
        <div class="offset-md-2 col-md-4">
        <br><br><br><br><br><br>
                    <h1><span style="color: orange; "> nemonaemo</span></h1>

                </div>
                <div class="card-body">
                
                    <form action="join" name="signup" id="signUpForm" method="post">
                        
                        <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                         <tr>
                                <td style="text-align: left">
                                    <p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
                                </td>
                            </tr>

                            <tr>
                                <td><input type="text" name="name" id="user_name"
                                    class="form-control tooltipstered" maxlength="20"
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="이름"></td>
                            </tr>
                        
                             <tr>
                                <td style="text-align: left"><br>
                                    <p><strong>이메일을 입력해주세요.</strong>
                                    &nbsp;&nbsp;&nbsp;<span id="emailCheck"></span><span id = "chkMsg2"></span> </p>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                <div>
                                <input type="text" name="email" id="email" oninput="emailCheck()"
                                    class="form-control tooltipstered" 
                                    required="required" aria-required="true"
                                    style="width: 85%;  float:left;  height: 40px; border: 1px solid #d9d9de"
                                    placeholder="ex) nmnm@test.com">
                                    <button type="submit" id="checkbtn" class="btn btn-primary pull-right" >중복확인</button>
                                </div>

                                    </td>
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
                                    style="ime-mode: inactive; margin-bottom: 25px;  height: 40px;  border: 1px solid #d9d9de"
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
                                    style="ime-mode: inactive; margin-bottom: 25px;  height: 40px;   border: 1px solid #d9d9de"
                                    placeholder="비밀번호가 일치해야합니다."></td>
                            </tr>
            
                           
                                <td>
                                <input
                                    type="button" value="회원가입" 
                                    class="btn form-control tooltipstered" id="signup-btn"
                                    style="background: gray; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
                                </td>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </div>




<script type="text/javascript">
function emailCheck(){
	var email = $('email').val();
     $.ajax({
       type: 'POST',
       datatype: "json",
       data: {email : $("#email").val()},
       url: "emailCheck",
       success : function(result){
           if (result == 0){
        	   $("#chkMsg2").html("사용가능");
               console.log("넘어온 값 : " + result);
           } else {
               idck = 1;
               $("#chkMsg2").html("이미 사용중인 메일 입니다.");
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
    const getName= RegExp(/^[가-힣]{2,6}$/);
    const getEmail= RegExp(/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/);
    

    
    
    //입력값 검증을 마칠 경우 true로 설정 
    //(chk2 : 비번, chk3: 비번확인란, chk4: 이름, chk5: 이메일)
    let chk2 = false, chk3 = false, chk4 = false, chk5 = false;
    
    //회원가입 form DOM객체 저장.
    const regForm = $("#signUpForm");
    
    //이메일 입력값 검증.
    $('#email').on('keyup', function(){
    	//이메일 공백 확인
    	if($("#email").val() === ""){
            $('#email').css("background-color", "pink");
            $('#emailCheck').html('<b style="font-size:14px;color:red;"></b>');
            chk2 = false;
    }   //이메일 유효성검사
        else if(!getEmail.test($("#email").val()) || $("#email").val().length < 8){
            $('#email').css("background-color", "pink");
            $('#emailCheck').html('<b style="font-size:14px;color:red;">이메일 형식이 올바르지 않습니다.</b>');
            chk2 = false;
        } else {
            $('#email').css("background-color", "#b3ffb3");
            $('#emailCheck').html('<b style="font-size:14px;color:green;"></b>');
            chk2 = true;
        }
        
    });
    
    
    //패스워드 입력값 검증.
    $('#password').on('keyup', function() {
        //비밀번호 공백 확인
        if($("#password").val() === ""){
            $('#password').css("background-color", "pink");
            $('#pwChk').html('<b style="font-size:14px;color:red;">비밀번호를 입력해주세요.</b>');
            chk2 = false;
        }                
        //비밀번호 유효성검사
        else if(!getPwCheck.test($("#password").val())){
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
            $('#nameChk').html('<b style="font-size:14px;color:red;">한글은 2 ~ 4글자(공백 없음) , 영문은 Firstname(2 ~ 10글자)</b>');
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

</body>
</html>