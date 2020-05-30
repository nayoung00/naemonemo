<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
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
    .login-form {position: relative; z-index: 2;}
    .login-form h1 {
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
    <section class="login-form">
     <form action='login' method='post'> 
        <h1> "nmnm 로그인"</h1>
        <script src="jquery-3.4.1.js"></script>
            <div class="int-area">
                <input type="text" name="email" id="email"
                autocomplete="off" value='${cookie.email.value}' required>
                <label for="email">EMAIL</label>
            </div>
             <div class="int-area">
                <input type="password" name="password" id="password"
                 required>
                <label for="password">PASSWORD</label>
            </div>
        <div class="caption">
            <input type="checkbox" name='saveEmail'> Remember me</label>
            <a href="pwReset" class="pull-right">Forgot Password?</a>
            </div>
            
            <div class="btn-area">
                <button type="submit" value=login>LOGIN</button>
            </div>
<div class="caption">    
    <p class="text-center small">Don't have an account! <a href="join">Sign up here</a>.</p>
</div>
    <p>
    <hr color=" #D2691E" size="10">
    <div id="naverIdLogin"></div>
    
    
    </section>

<script type="text/javascript">
    var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "gpaO5pkwAnLvkrjATqmF",
            callbackUrl: "http://localhost:8080/nmnm/app/auth/callback",
            isPopup: true, /* 팝업을 통한 연동처리 여부 */
            loginButton: {color: "green", type: 3, height: 100} /* 로그인 버튼의 타입을 지정 */
        }
    );
    
    /* 설정정보를 초기화하고 연동을 준비 */
    naverLogin.init();
    
</script>
</body>
    
</html>