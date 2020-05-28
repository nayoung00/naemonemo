<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


  <!--content-->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">공지사항</h4>
                                <p class="category">모임의 공지가 올라오는 게시판</p>
                                  <a href='form'>새 글</a><br>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                      <th style="width: 10%">번호</th>
                                      <th style="width: 50%">제목</th>
                                      <th style="width: 10%">작성자</th>
                                      <th style="width: 10%">작성일</th>
                                      <th style="width: 10%">조회수</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="item">
                                        <tr>
                                          <td>${item.noticeNo}</td>
                                          <td><a href='detail?noticeNo=${item.noticeNo}'> ${item.title}</a></td>
                                          <td>${item.memberNo}</td>
                                          <td>${item.createDate}</td>
                                          <td>${item.viewCount}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <form action='search' method='get'>
             <div class="form-group">
               <label>검색어</label>
               <input name='keyword' type="text" class="form-control" placeholder="search" value="검색어를입력하세요">
             </div>
            <span>
            <button type="submit" class="btn btn-info btn-fill pull-right">검색</button>
            </span>
            </form>
        </div>



    