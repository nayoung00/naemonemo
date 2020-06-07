<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
 * {margin: 0; padding: 0; box-sizing: border-box;}
    body{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 5%;
        height: 100vh;
        background-size: cover
        }
    body::before {
        content: "";
        position: ablsolute; z-index: 1;
        top: 0; reght: 0; bottom: 0; left: 0;
        background-color: rgba(0,0,0,.7);
    }
    .join-form {position: relative; z-index: 2;}
    .join-form h1 {
        font-size: 32px; color: #F4A460;
        text-align: center;   
        margin-bottom: 60px; 
        }
    .int-area {
    width: 400px; position: relative;
    margin-top:20px;
    }
    .int-area:first-child {margin-top: 0;}
    .int-area input{
            width: 100%;
            padding: 20px 10px 10px;
           background-color: transparent;
           border: none;
           border-bottom: 1px solid #999;
           font-size: 18px; color:  #000000;
           outline: none;
            }
            
    .int-area label {
        position: absolute; left: 10px; top: 15px;
        font-size: 18px; color: #999;
        transition: all .5s ease;
   }
   
    .int-area input:focus + label, 
    .int-area input:valid + label{
        top: -2px;
        font-size: 13px; color: #F4A460;
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
   .caption {
        margin-top: 20px;
        
   }    
   .caption a{
    font-size: 15px; color: #999;
    text-decoration: none;
   } 
</style>
</head>
<body>
    <section class="join-form">
     <form action='join' method='post' id=joinForm> 
     <h1> "네모내모 회원가입"</h1>
            <div class="int-area">
                <input type="text" name="name" id="name" autocomplete="off" 
                 required>
                <label for="name">NAME</label>
            </div>
            <div class="int-area">
                <input type="text" name="email" id="email" autocomplete="off" oninput="emailCheck()" required>
                <label for="password">EMAIL</label>&nbsp;&nbsp;&nbsp;<span id = "chkMsg"></span> 
            </div>
            
            <div class="int-area">
                <input type="password" name="password" id="password"
                 required>
                <label for="password">PASSWORD</label>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span>
            </div>
            <div class="int-area">
                <input type="password" name="password2" id="password2"
                 required> 
                <label for="password2">CONFIRM PASSWORD</label>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span>
            </div>
            <div class="btn-area">
                <button type="submit" value=login>SIGNUP</button>
                <hr>
            </div>
     </form>
     </section>

<script>

//start JQuery
$(function() {
    //입력값 검증 정규표현식
    const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
    
    //패스워드 입력값 검증.
    $('#password').on('keyup', function() {
       if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
            $('#pwChk').html('<b style="font-size:14px;color:red;">특수문자 포함 8자이상 입력해주세요.</b>');
        } else {
        	$('#pwChk').html('');
        }
        
    });
    
    //패스워드 확인란 입력값 검증.
    $('#password2').on('keyup', function() {
        //비밀번호 확인란 공백 확인
       if($("#password").val() != $("#password2").val()){
            $('#pwChk2').html('<b style="font-size:14px;color:red;">비밀번호가 일치하지 않습니다.</b>');
        } else {
        	$('#pwChk2').html('');
        }
        
    });
});//end JQuery


function emailCheck(){
    var emailCheck = 0;
    $.ajax({
        type:'post',
        datatype: 'json',
        url:'emailCheck',
        data:{email: $('#email').val()},
        success:function(data){
            if(data == 0){
                $('#chkMsg').html();                
            }else{
                $('#chkMsg').html('<b style="font-size:14px;color:red;">이미 사용중인 이메일 입니다.</b>');
            }
        },
        error:function(){
                alert("에러입니다");
        }
});
};

</script>
</body>
</html>