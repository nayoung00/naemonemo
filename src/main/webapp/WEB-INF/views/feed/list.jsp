<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <!--본체 start -->
    <section id="blog" class="blog">
      <div class="container">
          <br />
          <br />
          <br />
        <div class="section-header">
          <div>
          <p>모임 검색 하시오</p>
          <form action="app/group/search" method="GET">
          <input type="text" name="keyword" placeholder="키워드" />
          <input type="submit" value="전송"/>
          </form>
          <p>
          <br>
          <button><a href="app/group/form">모임만들기</a></button>
          </p>
          </div>
        </div>
      </div>
           
       
      <div class="container">
       <div class="section-header">
       <hr>
       <br>
       <h4>추천모임 - 로그인한 멤버의 관심사와 일치하는 그룹의 리스트에서 썸네일을 가져온다</h4>
       </div>  
       <!--/.section-header-->
        
        <div class="blog-content">
          <div class="row">
            <div class="col-sm-4">
              <div class="single-blog">
                <div class="single-blog-img">
                  <img src="images/blog/b2.jpg" alt="blog image" />
                  <div class="single-blog-img-overlay">
                  </div>
                </div>
                <div class="single-blog-txt">
                  <h2><a href="app/group/listByRec">추천모임1</a></h2>
                </div>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="single-blog">
                <div class="single-blog-img">
                  <img src="images/blog/b2.jpg" alt="blog image" />
                  <div class="single-blog-img-overlay">
                  </div>
                </div>
                <div class="single-blog-txt">
                  <h2><a href="#">추천모임2</a></h2>
                </div>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="single-blog">
                <div class="single-blog-img">
                  <img src="images/blog/b3.jpg" alt="blog image" />
                  <div class="single-blog-img-overlay">
                  </div>
                </div>
                <div class="single-blog-txt">
                  <h2><a href="#">추천모임3</a></h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.container-->

      <div class="container">
        <div class="section-header">
        <hr>
        <br>
        <h4>신규모임 - 그룹리스트를 최신순으로 정렬해서 정보를 가져온다</h4>
        </div>
        <!--/.section-header-->
        
        <div class="blog-content">
          <div class="row">
            <div class="col-sm-4">
              <div class="single-blog">
                <div class="single-blog-img">
                  <img src="images/blog/b1.jpg" alt="blog image" />
                  <div class="single-blog-img-overlay"></div>
                </div>
                <div class="single-blog-txt">
                  <h2><a href="app/group/listByCd ">신규모임1</a></h2>
                </div>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="single-blog">
                <div class="single-blog-img">
                  <img src="images/blog/b2.jpg" alt="blog image" />
                  <div class="single-blog-img-overlay"></div>
                </div>
                <div class="single-blog-txt">
                  <h2><a href="#">신규모임2</a></h2>
                </div>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="single-blog">
                <div class="single-blog-img">
                  <img src="images/blog/b3.jpg" alt="blog image" />
                  <div class="single-blog-img-overlay"></div>
                </div>
                <div class="single-blog-txt">
                  <h2><a href="#">신규모임3</a></h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.container-->
    </section>
    <!--/.blog-->
    <!--blog end -->
    
    
    <!-- /////////////////////////////////////////////////////// -->

  <h1>피드</h1>
  <a href='form'>새 글</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>제목</th>
    <th>회원번호(작성자)</th>
    <th>등록일</th>
    <th>조회수</th>
    <th>사진</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.feedNo}</td> 
    <td><a href='detail?feedNo=${item.feedNo}'> ${item.title}</a></td> 
    <td>${item.memberNo}</td>
    <td>${item.createDate}</td> 
    <td><c:out value="${item.viewCount}"/></td>
    <td><img src="${pageContext.servletContext.contextPath}/upload/feed/${item.feedPhotos[0].filepath}" width='240'></td>
  </tr>
</c:forEach>

</table>

<hr>
<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>

