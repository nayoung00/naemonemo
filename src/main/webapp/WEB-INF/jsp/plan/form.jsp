<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>일정 등록하기</h1>
<form action='add' method='post' >
일정: <input name='planDate' type='date'><br>
제목: <input name='title' type='text'/><br/>
장소: <input name='placeName' type='text'/><br/>
주소: <textarea name='address' rows='1' cols='60'></textarea><br>
위도: <input name='latitude' type='text'/><br/>
경도: <input name='longitude' type='text'/><br/>
<button>제출</button>
</form>

<jsp:include page="../footer.jsp"/>