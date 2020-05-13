<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.virtual-box {
    margin-bottom: 120px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />

<!-- 회원가입 양식 -->

<div class="virtual-box"></div>
<div class="container">
    <div class="row">
        <div class="offset-md-2 col-md-4">
            <div class="card" style="width:200%;">
                <div class="card-header text-white" style="background: #343A40;">
                    <h2><span style="color: gray;">nmnm</span> 회원 가입</h2>
                </div>
                <div class="card-body">
                    <form action="join" name="signup" id="signUpForm" method="post"
                        style="margin-bottom: 0;">
                        
                        <!-- 권한은 일반회원으로 고정(나중에 라디오버튼으로 선택지를 주셔도됩니다.) -->
                        <input type="hidden" name="auth" value="common">
                        
                        <table
                            style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                             <tr>
                                <td style="text-align: left">
                                    <p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
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
                                    <p><strong>핸드폰번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="telChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="text" name="tel" id="tel"
                                    class="form-control tooltipstered" maxlength="20"
                                    required="required" aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="ex) 010-1234-1234"></td>
                            </tr>
                             
                             
                                <tr>
                                <td style="text-align: left">
                                    <p><strong>우편번호</strong>&nbsp;&nbsp;&nbsp;<span id="postCodeChk"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="button" name="name" id="sample6_postcode"  onclick="sample6_execDaumPostcode()" 
                                    class="form-control tooltipstered" maxlength="5"
                                    vlaue="우편번호 찾기"
                                    aria-required="true"
                                    style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                                    placeholder="우편번호"></td>
                            </tr>
                             
                    <label>Address</label>
                    <form:input class="w3-input" id="sample6_address" path="m_address"
                        placeholder="주소" readonly="true" />
                    <font color="red"><form:errors path="m_address" /></font> <input
                        class="w3-input" id="m_address" name="m_address"
                        placeholder="상세주소" />
                    <!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_address" id="m_address"> -->
                    <div class=checkNick></div>
                             
                             
                             
                             
                             
                             
                             
                             
                             
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
</div>

<jsp:include page="../footer.jsp" />

<script>
//start JQuery
$(function() {
    
    //입력값 검증 정규표현식
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
    const getName= RegExp(/^[가-힣]+$/);
    const getTel= RegExp(/(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/);    
    //입력값 검증을 마칠 경우 true로 설정 
    //(chk1 : 아이디검증, chk2 : 비번, chk3: 비번확인란, chk4: 이름, chk5: 이메일)
    let chk1 = false, chk2 = false, chk3 = false, chk4 = false;
    
    //회원가입 form DOM객체 저장.
    const regForm = $("#signUpForm");
    
/*     
  //이메일 입력값 검증.
    $('#email').on('keyup', function() {
        //이메일값 공백 확인
        if($("#email").val() == ""){
            $('#email').css("background-color", "pink");
            $('#emailChk').html('<b style="font-size:16px;color:red;">[이메일을 입력해주세요]</b>');
            chk5 = false;
        }                
        //이메일값 유효성검사
        else if(!getMail.test($("#email").val())){
            $('#email').css("background-color", "pink");
            $('#emailChk').html('<b style="font-size:16px;color:red;">[이메일 형식을 확인해주세요.]</b>');
            chk5 = false;
        } else {
            
        	//입력한 id를 읽어온다.
            var id = $("#id").val();
            //문자열을 ajax 요청을 통해서 서버에 전송
            $.ajax({
                method:"post",
                url:"checkid.jsp",
                data:{id:id},
                success:function(data){
                    if(data.response){//존재하는 아이디이면,
                        alert("이미 사용하는 아이디입니다.");
                        $("#id").val("");
                        $("#id").focus();
                    }else{//존재하지 않으면
                        alert("사용가능한 아이디입니다.");
                    }
                    
                    isCheckId = true;
                }
            });
            
            return false;// 안 해놓으면, signup.jsp 로 넘어간다.
        });
 */
    
    
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
        
        //전화번호 입력값 검증.
        $('#tel').on('keyup', function() {
            //전화번호 공백 확인
            if($("#tel").val() === ""){
                $('#tel').css("background-color", "pink");
                $('#telChk').html('<b style="font-size:14px;color:red;">[전화번호를 입력해주세요.]</b>');
                chk1 = false;
            }                
            //전화번호 유효성검사
            else if(!getTel.test($("#tel").val())){
                $('#tel').css("background-color", "pink");
                $('#telChk').html('<b style="font-size:14px;color:red;">[형식이 틀렸습니다.]</b>');
                chk1 = false;
            } else {
                $('#tel').css("background-color", "#b3ffb3");
                $('#telChk').html('<b style="font-size:14px;color:green;"></b>');
                chk1 = true;
            }
        });   
        
    });
    

    
    //회원가입 버튼 클릭 이벤트
    $('#signup-btn').click(function() {
        if(chk1 && chk2 && chk3 && chk4) {
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