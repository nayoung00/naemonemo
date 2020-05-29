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
                                <h4 class="title">공지 댓글</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                      <th style="width: 10%">공지번호</th> 
                                      <th style="width: 10%">번호</th>
                                      <th style="width: 70%">내용</th>
                                      <th style="width: 10%">작성자</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="item">
                                        <tr>
                                          <td>${item.noticeNo}</td>
                                          <td>${item.noticeReplyNo}</td>
                                          <td>${item.content}</td>
                                          <td>${item.memberNo}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="content">
            <div class="container-fluid">
             <form action='replyadd' method="post">    
                             공지번호: <input name='noticeNo' type="number"><br>
                             회원번호: <input name='memberNo' type="number"><br> 
                             내용:<br><textarea name='content' rows='5' cols='60'></textarea><br>
             <button>등록</button>
             </form>       
            </div>
        </div>
    