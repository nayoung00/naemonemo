<script>
$(function() {
    
    //입력값 검증 정규표현식
    const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
    const getName= RegExp(/^[가-힣]+$/);
    //입력값 검증을 마칠 경우 true로 설정 
    //(chk2 : 비번, chk3: 비번확인란, chk4: 이름, chk5: 이메일)
    let chk2 = false, chk3 = false, chk4 = false;
    
    //회원가입 form DOM객체 저장.
    const regForm = $("#signUpForm");
    
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
    </script>

<script type="text/javascript">
    $(document).ready(function() {
        // alert('${uri}');
        $('#selmail').change(function() {
            var url = $(this).val();
            if(url !='directVal'){
                $('#email_url').val(url)
                               .prop('readonly',true);
            } else{
                $('#email_url').val('')
                               .removeAttr('readonly')
                               .focus();        
            }
        });
    });
        
    $(function(){
        // 비밀번호가 유효한 값인지 체크해주는 Flag값
        // default값 false
        var pwFlag = false;
        // 유효성체크 여부를 알려주는 배열
        var checkArr = new Array(6).fill(false);
        // 코드의 재사용을 줄이기 위해서 따로 함수로 빼서 이용함
        // printCheckArr(checkArr);
        // 유효성체크 모두 통과 or 불통여부를 알려주는 변수 최종결정권자
        var checkAll = true;
        
        //alert('user: '+ '${user}');
        
        if('${user}' !=''){
            // 회원정보수정 디자인 변경
            //  버튼 텍스트가 수정하기
            $('#btn_join').text('수정하기');
            //  비밀번호, 비밀번호 재설정 제거
            $('.join_row:eq(1)').css('display','none');
            //  id에 readonly효과를 줘서 입력이 불가능 
            // id=#id 를 제거해서 우리가 입력한 유효성체크동작 불가능
            $('.int:eq(0)').attr('readonly', 'true').removeAttr('id');
            // 수정시 회원이메일을 받아오는 input태그를 바꾸는 작업
            $('.email_hidden_box').css('display','block');
            $('.email_box').css('display','none');
            // id칸 색깔바꾸기
            $('.int_id').css('background-color','#ffe6dc');
            $('.id_input').css('background-color','#ffe6dc');
            
            var name = '${user.name}';
            var email = '${user.email}'; 
            var phone = '${user.phone}';
            var postcode = '${user.postcode}';
            var addr1 = '${user.addr1}';
            var addr2 = '${user.addr2}';
            // name작성시 숫자올리도록
            $('#name_cnt').text(name.length);
            ckName(name);
            ckEmail(email);
            ckPhone(phone);
            ckAddr(postcode, addr2);
            checkArr[0] = true;
            checkArr[1] = true;
            ckColorBtn();
            printCheckArr(checkArr);
        }
        
        function ckDesign(code, desc, line, msg){
            if(code == 0 || code == 10){ //통과o
                $('.ps_box:eq('+line+')').css('border','1px solid #dadada');
                $('.join_err_msg:eq('+msg+')').css('visibility','hidden');
                return true;
            } else { // 통과x
                $('.ps_box:eq('+line+')').css('border','1px solid #f24443');
                // 테두리 색생변경
                $('.join_err_msg:eq('+msg+')').css('visibility','visible')
                                       .text(desc)
                                       .css('color','#f24443');
                // 에러메세지 출력
                return false;
            }
        }
        
    
        // 비밀번호 유효성 체크
        $('#upw').keyup(function(){
            // 1. 사용자가 입력한 값 받기
            // .trim() 의 또다른 사용방법
            var pw = $.trim($(this).val());
            var rpw = $('#urpw').val().trim();
            // 2. 유효성 체크하기
            var result = joinValidate.checkPw('', pw, rpw);
            
            // 3. 체크결과에 따라 디자인 하기
            ckDesign(result.code, result.desc, 1, 1);
            
            if(result.code == 0 || result.code == 10 || result.code == 6){
                pwFlag = true;
            } else{
                pwFlag = false;
            }
            if(result.code == 10){
                checkArr[1] = true;
                $('.ps_box:eq(2)').css('border','1px solid #dadada');
                $('.join_err_msg:eq(1)').css('visibility','visible')
                                        .text('입력한 비밀번호가 일치합니다.')
                                        .css('color','#3885ca');
            } else {
                checkArr[1] = false;
            }
        });
        // 비밀번호 재확인 유효성 체크
        $('#urpw').keyup(function(){
            var pw = $.trim($('#upw').val());
            var rpw = $.trim($('#urpw').val());
            var result = joinValidate.checkRpw(pw, rpw, pwFlag);
            console.log(result.code+","+result.desc);
            ckDesign(result.code, result.desc, 2, 1);
            
            if(result.code == 10){
                checkArr[1] = true;
                console.log(checkArr[1]);
                $('.ps_box:eq(1)').css('border','1px solid #dadada');
                $('.join_err_msg:eq(1)').css('visibility','visible')
                                        .text('입력한 비밀번호가 일치합니다.')
                                        .css('color','#3885ca');
            } else if(result.code == 6){
                checkArr[1] = false;
                $('.ps_box:eq(1)').css('border','1px solid #dadada');
            } else {
                checkArr[1] = false;
            }
            // printCheckArr(checkArr);
        });
        // 이름 유효성체크
        $('#uname').keyup(function(){
            var name = $(this).val().trim();
            // console.log(name); // 꼭 확인하고 넘어가기
            $('#name_cnt').text(name.length);
            ckName(name);
        });
        
        function ckName(name) {
            var result = joinValidate.checkName(name);
            ckDesign(result.code, result.desc, 3, 2);
            
            if(result.code == 0){
                checkArr[2] = true;
            } else {
                checkArr[2] = false;
            }
            // printCheckArr(checkArr);
        }
             
        // 이메일 유효성체크
        // email id값을 입력하면 url도 확인해서 필수정보입니다 출력하는 함수
        $('#uemail').keyup(function(){
            var e_id = $(this).val().trim();
            var url = $('#selmail').val().trim();
            if(url == '' || url.length == 0){
                var result = joinValidate.checkEmail(url);
                ckDesign(result.code, result.desc, 6,3);
            } else if(e_id == '' || e_id.length == 0){
                var result = joinValidate.checkEmail(url);
                ckDesign(result.code, result.desc, 5,3);
            } else if(url == 'directVal'){
                url = $('#email_url').val().trim();
                var email = e_id +'@'+ url;
                console.log(email);
                var result = joinValidate.checkEmail(email);
                if(result.code == 0){
                    checkArr[3] = true;
                } else {
                    checkArr[3] = false;
                }
                // printCheckArr(checkArr);
                ckDesign(result.code, result.desc, 5, 3);
                ckDesign(result.code, result.desc, 6, 3);
            } else {
                $('.ps_box:eq(5)').css('border','1px solid #dadada');
                var email = e_id +'@'+ url;
                console.log(email);
                var result = joinValidate.checkEmail(email);
                if(result.code == 0){
                    checkArr[3] = true;
                } else {
                    checkArr[3] = false;
                }
                // printCheckArr(checkArr);
                ckDesign(result.code, result.desc, 5, 3);
            }
            
        });
        // email url을 선택하면 직접입력 확인해서 유효성 체크하는 함수
        $('#selmail').change(function(){
            var e_id = $('#uemail').val().trim();
            var url = $(this).val().trim();
            if(url == '' || url.length == 0){
                var result = joinValidate.checkEmail(url);
                ckDesign(result.code, result.desc, 6,3);
            } else if(url == 'directVal'){
                if(e_id == '' || e_id.length == 0){
                    var result = joinValidate.checkEmail(e_id);
                    ckDesign(result.code, result.desc, 5,3);
                } else {
                    $('.ps_box:eq(5)').css('border','1px solid #dadada');
                    url = $('#email_url').val().trim();
                    var email = e_id +'@'+ url;
                    console.log(email);
                    var result = joinValidate.checkEmail(email);
                    if(result.code == 0){
                        checkArr[3] = true;
                    } else {
                        checkArr[3] = false;
                    }
                    // printCheckArr(checkArr);
                    ckDesign(result.code, result.desc, 6, 3);
                }
            } else {
                $('.ps_box:eq(5)').css('border','1px solid #dadada');
                $('.ps_box:eq(6)').css('border','1px solid #dadada');
                var email = e_id +'@'+ url;
                var result = joinValidate.checkEmail(email);
                if(result.code == 0){
                    checkArr[3] = true;
                } else {
                    checkArr[3] = false;
                }
                // printCheckArr(checkArr);
                ckDesign(result.code, result.desc, 5, 3);
            }
        });
        $('#email_url').keyup(function(){
            var e_id = $('#uemail').val().trim();
            var url = $(this).val().trim();
            if(e_id == '' || e_id.length == 0){
                var result = joinValidate.checkEmail(e_id);
                ckDesign(result.code, result.desc, 5,3);
            } else {
                $('.ps_box:eq(5)').css('border','1px solid #dadada');
                var email = e_id +'@'+ url;
                console.log(email);
                var result = joinValidate.checkEmail(email);
                if(result.code == 0){
                    checkArr[3] = true;
                } else {
                    checkArr[3] = false;
                }
                // printCheckArr(checkArr);
                ckDesign(result.code, result.desc, 6, 3);
            }
            
        });
        // 회원정보수정의 이메일
        $('#emailAll').keyup(function(){
            var email= $.trim($(this).val());
            ckEmail(email);
        });
        
        function ckEmail(email){
            var result = joinValidate.checkEmail(email);
            ckDesign(result.code, result.desc, 4, 3);
            
            if(result.code == 0){
                checkArr[3] = true;
            } else {
                checkArr[3] = false;
            }
        }
        // 버튼 활성화!
        $('.int').keyup(function(){
            ckColorBtn();
        });
        
        function ckColorBtn(){
            var checkAll = true;
            for(var i = 0; i < checkArr.length; i++){
                if(!checkArr[i]){
                    checkAll = false;
                }
            }
            if(checkAll){
                $('.btn_type').addClass('btn-agree');
                $('.btn_type').css('cursor','pointer');
            } else{
                $('.btn_type').removeClass('btn-agree');
                $('.btn_type').css('cursor','no-drop');
            }
        }
        
        // 회원가입 버튼 클릭!
        $('#btn_join').click(function(){
            var invalidAll = true;
            for(var i=0; i < checkArr.length; i++){
                if(!checkArr[i]){
                    invalidAll = false;
                    $('.join_err_msg:eq('+i+')').css('visibility','visible')
                                   .css('color','#f24443');
                } 
            }
            printCheckArr(checkArr);
            if(invalidAll){
                FunLoadingBarStart(); // 로딩바생성
                
                var email = $('#emailAll').val();
                
                if(email == '' || email.length == 0){
                    var id= $('#uemail').val();
                    var url= $('#email_url').val();
                    $('#emailAll').val(id+'@'+url);
                }
                
                // alert('회원가입성공');
                
                // submit(): form태그 안에 있는 데이터들을 서버단으로 전송하세요
                // action: 목적지(MemberController '/join')
                // method: 방법( POST 숨겨서)
                $('#frm_member').submit();
                
            } else{
                console.log(invalidAll);
                alert('값을 모두 입력해주세요.');
                
            }
        });
    });
    
    // 개발시 사용: 유효성체크 전체 여부를 출력해주는 함수 (true, false)
    function printCheckArr(checkArr){
        for(var i=0; i < checkArr.length; i++){
            console.log(i+'번지 '+checkArr[i]);   
        }
    }
    // 로딩바 출력
    function FunLoadingBarStart(){
        var loadingBarImage = ''; // 가운데 띄워줄 이미지
        loadingBarImage += "<div id='back'>";
        loadingBarImage += "<div id='loadingBar'>";
        loadingBarImage += "<i class='fas fa-bone loading_img'></i>";
        loadingBarImage += "</div></div>";
        $('body').append(loadingBarImage);
        $('#back').css('display', 'flex');
        $('#loadingImg').show();
    }
    // 로딩바 제거 , 지금은 필요없음 나중에?
    function FunLoadingBarEnd(){
        $('#back, #loadingBar').hide();
        $('#back, #loadingBar').remove();
    }