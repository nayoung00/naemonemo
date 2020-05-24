<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js" ></script>

<meta charset="UTF-8">

<title>Insert title here</title>

<style>
.flex-container{
  width: 100%;
  height: 100vh;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.greenbox {
  background: white;
  text-align: center;
  padding: 2em;
}

td{
    padding: 5px;
} 
</style>

</head>
<body>

<div class="flex-container">
  <div class="greenbox">
    <td><h1>FIND PASSWORD</h1><td>
</tr>
<tr>
    <td><input class="form-control textWidthLarge" type="text" id="name" name="name" required placeholder="이름을 입력해 주세요"><td>
</tr>
<tr>
    <td><input class="form-control textWidthLarge" type="email" id="email" name="email" required placeholder="이메을을 입력해 주세요"><td>
</tr>
<tr>
<span id = "chkMsg2"></span>
    <td><input  type="button"  class="btn btn-default btn-sm" onclick="checkEmail()"value="임시 비밀번호 전송" ><td>
</tr>
</div>
</div>
                            
<script>
    
// 아이디 유무 체크 및 임시 비밀번호 생성
function checkEmail() {
            //이메일유효성체크
            var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
            var checkName = RegExp(/^[가-힣a-zA-Z]+$/); // 이름: 한글,영문만 가능
            // 이름 유효성 검사
        
            var id = $('#email').val();
            
            if (id.length < 1 ) {
                alert('이메일을 입력해주세요!');
                return false;
            }
            if(!exptext.test(id)){
                
                alert('이메일 형식이 아닙니다');
                return false;
            }
            
            if (!checkName.test($('#name').val())) {
                alert('[이름] 한글,영문만 가능');
            
                return false;
            }
 
            
            
            else {
                $.ajax({
                    url : 'resetPassword',
                    data : {
                        email : $('#email').val(),
                        name : $('#name').val()
                          },
                    type : 'post',
                    success:function(data){
                        if($.trim(data)==0){
                            $('#chkMsg2').html("등록되지 않은 메일 입니다.").css("color", "red");  
                            $("#complebutton").attr("disabled", "disabled");
                        }else{
                            $('#chkMsg2').html("등록된 이메일 입니다. 완료를 눌러 주세요").css("color", "green");
                            $("#complebutton").removeAttr("disabled");
                        }
                    },
                    error:function(){
                            alert("에러입니다");
                    }
                });
            }
    return false;
        }
</script>
</body>
</html>






