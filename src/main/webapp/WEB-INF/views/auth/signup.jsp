<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    $(function(){
        $("#sinUp").submit(function(){
            if($("#pw").val() !== $("#pw2").val()){
                alert("비밀번호가 다릅니다.");
                $("#pw").val("").focus();
                $("#pw2").val("");
                return false;
            }else if ($("#pw").val().length < 8) {
                alert("비밀번호는 8자 이상으로 설정해야 합니다.");
                $("#pw").val("").focus();
                return false;
            }
        })
        
        $("#tel").keyup(function() {
            $.ajax({
                url : "./check_tel",
                type : "POST",
                data : {
                    id : $("#id").val()
                },
                success : function(result) {
                    if (result == 1) {
                        $("#tel_check").html("중복된 번호가 있습니다.");
                        $("#joinBtn").attr("disabled", "disabled");
                    } else {
                        $("#tel_check").html("");
                        $("#joinBtn").removeAttr("disabled");
                    }
                },
            })
        });
        
        $("#email").keyup(function(){
            $.ajax({
                url : "./check_email",
                type : "POST",
                data : {
                    email : $("#email").val()
                },
                success : function(result) {
                    if (result == 1) {
                        $("#email_check").html("중복된 이메일이 있습니다.");
                    } else {
                        $("#email_check").html("");
                    }
                },
            })
        });
    })
</script>

<title>SignUp</title>
</head>
<body>
    <div class="w3-content w3-container w3-margin-top">
        <div class="w3-container w3-card-4">
            <div class="w3-center w3-large w3-margin-top">
                <h3>회원가입</h3>
            </div>
            <div>
                <form id="joinForm" action="login" method="post">
                    <p>
                        <label>Email</label>
                        <input type="text" id="email" name="email" class="w3-input" required placeholder="이메일 인증 후 로그인이 가능합니다.">
                        <span id="email_check" class="w3-text-red"></span>
                                                <button type="submit" id="approvalStatus" class="w-button w3-block w-black w3-ripple w2-margin-top w2-round">인증 메일 전송</button>
                    </p>
                    <p>
                        <label>Password</label> 
                        <input class="w3-input" id="pw" name="pw" type="password" required>
                    </p>
                    <p>
                        <label>Confirm</label> 
                        <input class="w3-input" id="pw2" type="password" required>
                    </p>
                    <p>
                        <label>Name</label> 
                        <input class="w3-input" type="text" id="name" name="name" required> 
                        <span class="w3-text-red"></span>
                    </p>
                    <p>
                        <label>Tel</label> 
                        <input class="w3-input" type="text" id="tel" name="tel" required> 
                    </p>
                    <p class="w3-center">
                        <button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Join</button>
                        <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
                    </p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>