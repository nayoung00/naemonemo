<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>회원 상세정보</h1>
<c:if test="${not empty member}">
<form action='update' method='post' enctype='multipart/form-data'>
<img src='${pageContext.servletContext.contextPath}/upload/member/${member.photo}' height='80'><br>
번호: <input name='no' type='text' readonly value='${member.no}'><br>
이름: <input name='name' type='text' value='${member.name}'><br>
별명: <input name='nickname' type='text' value='${member.nickname}'><br>
자기소개: <input name='intro' type='text' value='${member.intro}'><br>
이메일: <input name='email' type='email' value='${member.email}'><br>
사진: <input name='photoFile' type='file' value='${member.photo}'><br>
SNS: <input name='sns' type='text' value='${member.sns}'><br>
가입일: <input name='createDate' readonly type='date' value='${member.createDate}'><br>
<p><button>변경</button>
<a href='delete?no=${member.no}'>삭제</a></p>
</form>
</c:if>

<c:if test="${empty member}">
<p>해당 회원이 없습니다.</p>
</c:if>
