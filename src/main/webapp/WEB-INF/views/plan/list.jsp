<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty loginUser}">
  <h1>일정</h1>
  <form action="form" method="GET">
  <input type="hidden" name="groupNo" value="${param.groupNo}" />
  <button>일정 작성</button>
  </form>
<hr>

<div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Striped Table with Hover</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                      <th>ID</th>
                                      <th>제목</th>
                                      <th>생성일</th>
                                    </thead>
                                    <tbody>
                                      <tr>
                                    <c:forEach items="${list}" var="item">
										                    <td>${item.planNo}</td> 
										                    <td><a href='detail?planNo=${item.planNo}'> ${item.title}</a></td>
										                    <td>${item.createDate}</td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
</c:if>
<c:if test="${empty loginUser}">
    <p>로그인이 필요한 페이지 입니다.</p>
    <a href="../auth/login"><button>로그인</button></a>
</c:if>

<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>
