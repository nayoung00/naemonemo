<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1 style='text-align:center'>${plan.title}</h1>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">일정 작성</h4>
                            </div>
                            <div class="content">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>제목</label>
                                                <p class="form-control">${plan.title}</p>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>작성자</label>
                                                <p class="form-control">${plan.memberName}</p>
                                            </div>
                                        </div>                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>시작일</label>
                                                <p  class="form-control">${plan.startDate}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>종료일</label>
                                                <p class="form-control" >${plan.endDate}</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>주소</label>
                                                <p class="form-control">${plan.address}</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>상세 계획</label>
                                                <p style="height : 130px; overflow-y: scroll" class="form-control" >${plan.content}</p>
                                            </div>
                                        </div>
                                    </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label for="category">구분</label>
                                <p id="category" class="form-control">${plan.category}</p>
                            </div>
                        </div>                                    
                                    <button type="submit"  class="btn btn-info btn-fill pull-right">등록하기</button>
                                    <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" id="blah" src="${pageContext.servletContext.contextPath}/upload/plan/${plan.thumbnail}" alt="..."/>
                                      <h4 class="title">Mike Andrew<br />
                                         <small>michael24</small>
                                      </h4>
                                    </a>
                                </div>
                                <p class="description text-center"> "Lamborghini Mercy <br>
                                                    Your chick she so thirsty <br>
                                                    I'm in that two seat Lambo"
                                </p>
                            </div>
                            <hr>
                            <div class="text-center">
                                <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                                <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                                <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>
                            </div>
                        </div>
                    </div>
<div class="col-md-3">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="header">
                                <h5 class="title">일정 참여자</h4>
                            </div>

                            <div class="content table-responsive table-full-width" id="dynamicTable">
                            </div>
                        </div>
                  </div>  
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detailModal">
                                     참여하기
                          </button>
</div>
               
                </div>
            </div>
        </div>
