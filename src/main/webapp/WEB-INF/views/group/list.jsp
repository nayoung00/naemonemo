<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="blog" class="blog">
    <div class="container">

<!--new-arrivals start -->
    <section id="new-arrivals" class="new-arrivals">
      <div class="container">
        <div class="section-header">
          <h2>가입한 그룹</h2>
        </div><!--/.section-header-->
        <div class="new-arrivals-content">
          <div class="row">
          <c:forEach items="${list}" var="item">
            <div class="col-md-3 col-sm-4">
              <div class="single-new-arrival">
                <div class="single-new-arrival-bg">
                  <img src="${item.groupPhoto}" alt="new-arrivals images">
                  <div class="single-new-arrival-bg-overlay"></div>
                  <div class="sale bg-1">
                    <p>sale</p>
                  </div>
                  <div class="new-arrival-cart">
                    <p>
                      <span class="lnr lnr-cart"></span>
                      <a href="#"></a>
                    </p>
                    <p class="arrival-review pull-right">
                      <span class="lnr lnr-heart"></span>
                      <span class="lnr lnr-frame-expand"></span>
                    </p>
                  </div>
                </div>
                <h4><a href='detail?no=${item.groupNo}'>${item.groupName}</a></h4>
                <p class="arrival-product-price">${item.groupForm}</p>
              </div>
            </div>
            </c:forEach>
          </div>
        </div>
      </div><!--/.container-->
    </section><!--/.new-arrivals-->
    <!--new-arrivals end -->

<form action='search' method='get'>
검색어: <input name='keyword' type='text'>
<button>검색</button>
</form>

    </div>
</section>