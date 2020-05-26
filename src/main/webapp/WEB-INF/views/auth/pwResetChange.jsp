<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- 비밀번호 체크 유호성 검사-->
    <script type="text/javascript">
    $(function(){
        
        $("input").keyup(function(){
            var userPass=$("#userPass").val();
            var passwordConfirm=$("#passwordConfirm").val();
            if(userPass != "" || passwordConfirm != ""){
                if(userPass == passwordConfirm &&  userPass.length < 8){
                     $("#checkPass").text("비밀번호가 일치합니다. 하지만 비밀번호는 8자리 이상이어야 합니다.").css("color", "red");  
                     $("#changePassBtn").attr("disabled", "disabled");
                }else if(userPass == passwordConfirm &&  userPass.length >= 8){
                     $("#checkPass").text("비밀번호가 일치합니다. 변경하기를 눌러주세요").css("color", "blue");
                     $("#changePassBtn").removeAttr("disabled");
                }else{
                    $("#checkPass").html("비밀번호가 일치하지 않습니다.").css("color", "red");  
                    $("#changePassBtn").attr("disabled", "disabled");
                }    
            }
        });
    });
    </script>
</head>
<body>
    <!-- Navigation -->
    <div class="container full-width bg-white section-page">
       <div class="row text-center loginwrap">
            <div class="col-md-3 col-xs-12">
                    <h3>비밀번호 재설정</h3>
                 <form action="/minyas/client/changePassword" method="post">
                    <input type="text" class="form-control" id="email"  name = "email" readonly value="${email}">
                    <input type="password" class="form-control" id="userPass"  name = "userPass" placeholder="새 비밀번호를 입력해주세요." value="">
                    <input type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호를 다시 입력해주세요."
                           value="">
                     <span id="checkPass"></span><br>
    
                    <button type="submit" class="btn btn-primary" id="changePassBtn" style="width: 150pt;">변경</button>
                 </form>
                
            </div>
       </div>
        
    </div>

</body>
</html>