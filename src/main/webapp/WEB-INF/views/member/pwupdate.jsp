<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- 비밀번호 체크 유호성 검사-->
    <script >
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
    </script>
    <style>
    .pwupdate-form{
    display: flex;
     justify-content: center;
     width: 50%;
      height: 100vh;
        background-size: cover
    }
    
     .pwupdate-form h1 {
        font-size: 32px; 
        color: #F4A460;
        text-align: center;   
        margin-bottom: 60px; 
        }
        
   .int-area {
    width: 400px; position: relative;
    margin-top:20px;
    }
    .int-area:first-child {margin-top: 0;}
    .int-area input{
            width: 130%;
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
    </style>
    
    
</head>
<body>
   <section class="pwupdate-form">
                 <form action="changePassword" method="post">
                    <h1>비밀번호 재설정</h1>
                          <p class="info">
             회원님의 개인정보를 안전하게 보호하고, 개인정보 도용으로 인한 피해를 예방하기 위해<br />
                        30일 이상 비밀번호를 변경하지 않은 경우 비밀번호 변경을 권장하고 있습니다.
                         </p>
                    <script src="jquery-3.4.1.js"></script>
                  <div class="int-area">
                  <label for="email" style="top: -2px; font-size: 13px; color: #F4A460; ">EMAIL</label>
                    <input type="email" id="email"  name = "email" readonly value="${loginUser.email}">
                     </div> 
                     <div class="int-area">
                <input type="password" name="password" id="password" required>
                <label for="password">NEW PASSWORD</label>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span>
            </div>
             <div class="int-area">
                <input type="password" name="password2" id="password2" required>
                <label for="password2">CONFIRM PASSWORD</label>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span>
            </div>
                   <div class="btn-area">
                <button type="submit" value=pwupdate>비밀번호 변경</button>
            </div>
                 </form>
                
   </section>

</body>
</html>