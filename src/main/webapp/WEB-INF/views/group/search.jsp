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
                                <h4 class="title">모임 리스트</h4>
                                <p class="category">가입한 모임 리스트 보는곳 차후에 포토 형식이나</p>
                                  <a href='form'>새 글</a><br>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                      <th style="width: 50%">이름</th>
                                      <th style="width: 10%">형태</th>
                                      <th style="width: 10%">지역</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="item">
                                        <tr>
                                                <td><a href='detail?no=${item.groupNo}'>${item.groupName}</a></td> 
                                                <td>${item.groupForm}</td> 
                                                <td>${item.city}</td>
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
                           검색어: <input name='keyword' type='text'>
            <button>검색</button>
            </form>
        </div>


    