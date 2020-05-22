<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 작업중!!! -->

<section id="blog" class="blog">
      <div class="container">
        <div class="section-header">
          <br />
          <br />
          <h2>내가 가입한 모임 썸네일 이미지가 뜸</h2>
          <br />
          <div><p>검색 하시오</p><form action="app/group/search" method="GET">
          <input type="text" name="keyword" placeholder="모임 이름" />
          <input type="submit" value="전송"/>
          </form>
          </div>
          <br />
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
                  <h2><a href="app/group/list">그룹리스트로(임시)</a></h2>
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
                  <h2><a href="#">모임2</a></h2>
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
                  <h2><a href="#">모임3</a></h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.container-->

      <div class="container">
        <div class="section-header">
          <br />
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
                  <h2><a href="#">모임4</a></h2>
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
                  <h2><a href="#">모임5</a></h2>
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
                  <h2><a href="#">모임6</a></h2>
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