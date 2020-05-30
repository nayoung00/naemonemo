<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호찾기</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script>


</script>
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
 <div id="wrap" >
    <div class="contact-clean">
        <form action="resetPassword" method="post" class="text-center">
        <br> <br> <br> <br> <br>
            <h1 class="text-center">비밀번호 찾기</h1>
            <p class="text-center">
                회원가입시 등록한 아이디와 이메일주소를 입력하시면,<br> 입력하신 이메일로 임시 비밀번호를 발급합니다.<br>
                <br>
            <div class="form-group has-success has-feedback" >
                <input type="text" name="name" placeholder="이름을 입력해주세요." style="width:500px; height:50px;" 
                    class="form-control"/>
            </div>
            <div class="form-group has-success has-feedback">
                <input type="email" name="email" placeholder="'@'포함한 이메일주소를 정확히 입력해주세요." style="width:500px; height:50px;" 
                    class="form-control" /><span id=emailCheck>&nbsp;</span><br> 
            </div>

            <div class="form-group">
                <input allign="center" class="btn btn-primary" type="submit" value="비밀번호 찾기"/>
            </div>
        </form>
    </div>
    </div>
    
</body>

</html>






