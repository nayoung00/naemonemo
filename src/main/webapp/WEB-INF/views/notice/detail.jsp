<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<h1>공지사항 상세정보</h1>

<c:if test="${not empty notice}">

번호: ${notice.noticeNo}<br>
제목: ${notice.title}<br>
내용: ${notice.content}<br>
작성자: ${notice.nickname}<br>
등록일: ${notice.createDate}<br>
조회수: ${notice.viewCount}<br>


<p>
<button><a href='delete?noticeNo=${notice.noticeNo}'>삭제</a></button>
<button><a href='updateForm?noticeNo=${notice.noticeNo}'>변경</a></button>
<button><a href="list.jsp">목록</a></button>
</p>

</form>
</c:if>

<c:if test="${empty notice}">
<p>해당 공지사항 게시물이 없습니다.</p>
</c:if>


<jsp:include page="replyView.jsp"/>