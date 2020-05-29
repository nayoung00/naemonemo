<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SignIn</title>
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
    .login-form {
        width: 340px;
        margin: 50px auto;
    }
    .login-form form {        
        margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .input-group-addon .fa {
        font-size: 18px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
</style>
</head>
<body>
<div class="login-form">
    <form action='login' method='post'> 
        <h2 class="text-center">네모네모</h2>   
        <div class="form-group">
        <br>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input name='email' type='email' class="form-control" value='${cookie.email.value}' placeholder="user@test.com" required="required">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Password" required="required">
            </div>
        </div>        
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Log in</button>
        </div>
        <!-- 
        
        <div id="naverIdLogin"></div>
        
         -->
        
        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox" name='saveEmail'> Remember me</label>
            <a href="pwReset" class="pull-right">Forgot Password?</a>
        </div>        
    </form>
    <p class="text-center small">Don't have an account! <a href="join">Sign up here</a>.</p>
</div>
<!-- 
<script type="text/javascript">
    var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "gpaO5pkwAnLvkrjATqmF",
            callbackUrl: "http://localhost:8080/nmnm/app/auth/callback",
            isPopup: true, /* 팝업을 통한 연동처리 여부 */
            loginButton: {color: "green", type: 3, height: 10} /* 로그인 버튼의 타입을 지정 */
        }
    );
    
    /* 설정정보를 초기화하고 연동을 준비 */
    naverLogin.init();
    
</script>
 -->
<script>
</script>
</body>
</html>                        