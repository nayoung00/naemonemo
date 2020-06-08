<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty loginUser}">

<div class="col-md-auto">
  <h1>일정</h1>

<hr>
                        <div class="card">
                            <div class="content table-responsive table-full-width">
                                <table class="type09" style="margin-left: auto; margin-right: auto;">
															    <thead>
															    <tr>
															        <th scope="cols">제목</th>
															        <th scope="cols">장소명</th>
															        <th scope="cols">카테고리</th>
															        <th scope="cols">작성일</th>
															    </tr>
															    </thead>
															    <tbody>
														        <c:forEach items="${list}" var="item">
														          <tr>
														            <th scope="row"><a href='detail?planNo=${item.planNo}'> ${item.title}</a></td>
														            <td>${item.placeName}</td>
														            <td>${item.category}</td>
														            <td>${item.createDate}</td>
														            </tr>
														        </c:forEach>
															    </tbody>
                                </table>
                           <form action="form" method="GET">
                             <input type="hidden" name="groupNo" value="${param.groupNo}" />
                             <button class="s-button">일정 작성</button>
                            </form>
                            </div>
                        </div>
                        <br>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button class="s-button">검색</button>
</form>
                    </div>
                        <br>
                        <br>
</c:if>
<c:if test="${empty loginUser}">
    <p>로그인이 필요한 페이지 입니다.</p>
    <a href="../auth/login"><button>로그인</button></a>
</c:if>


