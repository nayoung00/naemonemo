<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>모임 입력(JSP)</h1>
<form action='add' method='post' enctype='multipart/form-data'>
이름: <input name='name' type='text'><br>
소개: <input name='info' type='text'><br>
분류: <input name='category' type='text'/><br>
사진: <input name='photoFile' type='file'><br>
지역: <input name='city' type='text'/><br/>
<input type='submit' value='upload'/><br>
<button>제출</button>
</form>

<jsp:include page="../footer.jsp"/>