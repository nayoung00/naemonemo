<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>nmnm</title>
<link rel="stylesheet"  type="text/css" href="${path}/resources/css/common.css">
<style type="text/css">
   
   
    .ohyoyo_mypage{
        font-size: 2em;
    }
    .o_mypage{
        display: block;
        width: 310px;
        height: 100px;
        margin: 0 auto;
        font-size: 60pt;
        text-align: center;
        color: #F4A460;
    }
    
    .mypage_main{
        text-align: center;
        
    }
    .mypage_box{
    font-size: 60pt;
        width: 1200px;
        margin: 0 auto;
    }
    .mp_main_wrap{
        margin-bottom: 10px;
        padding: 65px 0 60px;
        position: relative;
    }
    .mp_main_content{
        display: inline-block;
        width: 600px;
    }
    .mp_m_content_bar{
        position: relative;
        width: 170px;
        height: 170px;
        float: left;
        overflow: hidden;
        margin: 0 30px 0;
        border: 3px solid;
        border-radius: 100px;
        text-align: center;
        line-height: 165px;
        font-size: 50px;
        color: #777;
    }
    .mp_main_massage{
        display: inline-block;
    }
    .msg_userid{
        font-size: 26px;
        padding-bottom: 12px;
        font-weight: 300;
        line-height: 1;
    }
    .msg_grade{
        font-size: 20px;
        margin-bottom: 30px;
        font-weight: 300;
        line-height: 1;
    }
    .msg_price{
        font-size: 14px;
        color: #f7b8b4;
        padding-bottom: 2px;
        border-bottom: 1px solid;
        display: inline;
    }
    .msg_userInfoLink{
        margin-top: 45px;
    }
    .msg_userInfoLink > a{
        position: relative;
        font-size: 14px;
        font-weight: bold;
        color: #000;
        background: none;
        text-align: left;
        padding-right: 60px;
        vertical-align: bottom;
        display: inline-block;
    }
    .msg_userInfoLink > a:after{
        content: '';
        display: inline-block;
        width: 17px;
        height: 13px;
        background: url(${path}/resources/img/icons8-right-bla.png) no-repeat center center;
        background-size: 90%;
        position: absolute;
        top: 53%;
        transform: translateY(-50%);
        right: 40px;
    }
    .mp_main_info{
        display: inline-block;
        margin-top: 40px;
        float: right; 
    }
    .mypage_listBox{
        padding: 40px 0 100px;
    }
    .mp_list{
        display: inline-block;
        border-top: 2px solid #000;
        margin-left: 20px;
        width: 48%;
    }
    .mp_list:first-child{
        margin-left: 0;
    }
    .mp_list li{
        display: block;
        line-height: unset;
        text-align: left;
        color: #000;
    }
    .mp_list li a{
        border-bottom: 1px solid #eee;
        padding: 30px 75px 30px 50px;
        font-size: 18px;
        font-weight: 500;
        color: #000;
        display: block;
        position: relative;
    }
    .mp_list li a:after{
        content: '';
        display: inline-block;
        width: 25px;
        height: 25px;
        position: absolute;
        top: 50%;
        right: 20px;
        transform: translateY(-50%);
        background: url(${path}/resources/img/icons8-right-bla.png) no-repeat center center;
        background-size: 80%;
    }
    .mp_list li a > span{
        color: #7f2929;
        font-size: 15px;
        float: right;
    }
</style>
</head>
<body>
    <div class="mypage_wrap">
        <div class="mypage_title">
            <h1 class="ohyoyo_mypage">
                <a href="#" class="o_mypage">my page</a>
            </h1>
        </div>
        <div class="mypage_content">
            <div class="mypage_main">
                <div class="mypage_box mp_main_wrap">
                        </div>
                   
                        <div class="mp_main_massage">
                            <p class="msg_userid"><strong>
                                <span class="name">${loginUser.name}</span>님 반갑습니다.
                            </strong></p>
                            <div class="msg_userInfoLink">
                            </div>
                        </div>
                    </div>
                    <div class="mp_main_info"></div>
                </div>
            </div>
            <div class="mypage_box mypage_orderlist">
                
            </div>
            <div class="mypage_box mypage_listBox">
                <div class="mp_list">
                    <ul>
                        <li><a href="#">참여모임</a></li>
                        <li><a href="${pageContext.servletContext.getContextPath()}/app/member/update">회원정보수정</a></li>
                        <li><a href="#">게시글관리</a></li>
                    </ul>
                </div>
                <div class="mp_list">
                    <ul>
                        <li><a href="#">관리모임</a></li>                   
                        <li><a href="pwupdate">비밀번호변경</a></li>
                        <li><a href="${path}/member/drop">회원탈퇴</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>