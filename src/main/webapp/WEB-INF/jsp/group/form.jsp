<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>모임 생성</h1>
<form action='add' method='post' enctype='multipart/form-data'>
이름: <input name='groupName' type='text'><br>
소개: <input name='groupInfo' type='text'><br>
형태:  <select name='groupForm'>
    <option>온라인
    <option>오프라인
      </select><br>
관심사: <input name='groupInterest' type='text'><br>
사진: <input name='photoFile' type='file'><br>
지역: <input name='city' type='text'/><br/>
등급 명칭: <input name='gradeName' type='text'/><br/>
<button>제출</button>
</form>

<jsp:include page="../footer.jsp"/>