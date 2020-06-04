<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h1>피드 상세정보</h1>

<c:if test="${not empty feed}">

번호: ${feed.feedNo}<br>
제목: ${feed.title}<br>
내용: ${feed.content}<br>
작성자: ${feed.nickname}<br>
등록일: ${feed.createDate}<br>
조회수: ${feed.viewCount}<br>

사진:
<br>
<p>
<c:forEach items="${feed.feedPhotos}" var="feedPhoto">
<br>
<img src="${pageContext.servletContext.contextPath}/upload/feed/${feedPhoto.filepath}" width='360'>
<br>
<br>
</c:forEach>
</p>


<p>
<button><a href='delete?feedNo=${feed.feedNo}'>삭제</a></button>
<button><a href='updateForm?feedNo=${feed.feedNo}'>변경</a></button>
<button><a href="list.jsp">목록</a></button>
</p>

</c:if>

<c:if test="${empty feed}">
<p>해당 게시물이 없습니다.</p>
</c:if>



<!-- 댓글화면 -->
<jsp:include page="replyView.jsp"/>