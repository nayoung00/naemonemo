<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>모임 변경</h1>
<form action='update' method='post' enctype='multipart/form-data'>
<img src='${pageContext.servletContext.contextPath}/upload/group/${group.groupPhoto}' height='80'><br>
번호: <input name='groupNo' type='text' readonly value='${group.groupNo}'><br>
이름: <input name='groupName' type='text' value='${group.groupName}'><br>
소개: <input name='groupInfo' type='text' value='${group.groupInfo}'><br>
사진: <input name='photoFile' type='file' value='${group.groupPhoto}'><br>
형태: <input name='groupForm' type='text' value='${group.groupForm}'><br>
관심사: <input name='groupInterest' type='text' value='${group.groupInterest}'><br>
도시: <input name='city' type='text' value='${group.city}'><br>
생성일: <input name='createDate' readonly type='date' value='${group.createDate}'><br>
<p><button>변경</button></p>
</form>
