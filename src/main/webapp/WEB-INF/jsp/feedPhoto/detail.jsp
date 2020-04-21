<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>사진 상세정보</h1>

<c:if test="${not empty photoBoard}">
<form action='update' method='post' enctype='multipart/form-data'>
번호: <input name='no' type='text' readonly value='${feedPhoto.feedPhotoNo}'><br>
내용:<br>
<textarea name='title' rows='5' cols='60'>${feedPhoto.title}</textarea><br>
등록일: ${feedPhoto.createdDate}<br>
조회수: ${feedPhoto.viewCount}<br>
수업: ${feedPhoto.feed.title}<br>
<hr>
사진 파일:<br>

<p>
<c:forEach items="${photoBoard.files}" var="photoFile">
<img src="${pageContext.servletContext.contextPath}/upload/feed/${photoFile.filepath}" height="80">
</c:forEach>
</p>

사진: <input name='photoFiles' type='file'><br>
사진: <input name='photoFiles' type='file'><br>
사진: <input name='photoFiles' type='file'><br>
사진: <input name='photoFiles' type='file'><br>
사진: <input name='photoFiles' type='file'><br>
<p><button>변경</button>
<a href='delete?no=${photoBoard.no}&lessonNo=${photoBoard.lesson.no}'>삭제</a></p>
</form>
</c:if>

<c:if test="${empty photoBoard}">
<p>해당 사진게시물이 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>
    