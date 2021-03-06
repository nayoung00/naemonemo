<%@ page import="java.util.List"%>
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
                               <a class="btn btn-info btn-fill pull-right" href='form'>글쓰기</a><br>
                            </div>
                            <br>
                            <br>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                      <th style="width: 10%">번호</th>
                                      <th style="width: 50%">제목</th>
                                      <th style="width: 10%">작성자</th>
                                      <th style="width: 10%">등록일</th>
                                      <th style="width: 10%">조회수</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="item">
                                        <tr>
                                          <td>${item.noticeNo}</td>
                                          <td><a href='detail?noticeNo=${item.noticeNo}'> ${item.title}</a></td>
                                          <td>${item.nickname}</td>
                                          <td>${item.createDate}</td>
                                          <td><c:out value="${item.viewCount}"/></td>
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
               <button type="submit" class="btn btn-info btn-fill pull-right">검색</button>
            </form>
        
        </div>
