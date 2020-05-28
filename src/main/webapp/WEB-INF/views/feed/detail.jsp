<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>피드 상세정보</h1>

<c:if test="${not empty feed}">


번호: ${feed.feedNo}<br>
제목: ${feed.title}<br>
내용: ${feed.content}<br>
회원번호(작성자닉네임조인): ${feed.memberNo}<br>
등록일: ${feed.createDate}<br>
조회수: ${feed.viewCount}<br>

사진:<br>

<p>
<c:forEach items="${feed.feedPhotos}" var="feedPhoto">
<img src="${pageContext.servletContext.contextPath}/upload/feed/${feedPhoto.filepath}" width='360'>
</c:forEach>
</p>



<p>
<button><a href='delete?feedNo=${feed.feedNo}'>삭제</a></button>
</p>
</form>
</c:if>

<c:if test="${empty feed}">
<p>해당 게시물이 없습니다.</p>
</c:if>

