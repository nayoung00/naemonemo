<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>


<h1 style='text-align:center'> 일정 등록하기</h1>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">일정 작성</h4>
                            </div>
                            <div class="content">
                               <form action='add' method='post' enctype='multipart/form-data'>
                               <input type="hidden" name="groupNo" value="${param.groupNo}" />
                               <input type="hidden" name="memberNo" value="${loginUser.memberNo}" />
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>제목</label>
                                                <input type="text" name="title" class="form-control" placeholder="title">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>시작일</label>
                                                <input type="datetime-local" name="startDate" class="form-control" placeholder="startDate" required="required">
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>종료일(기재 안할시 시작일이 종료일)</label>
                                                <input type="datetime-local" name="endDate" class="form-control" placeholder="endDate">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>주소</label>
                                                <input type="text" name="address" class="form-control" placeholder="address">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>사진</label>
                                                <input type="file" name="thumbnailFile" id="thumbnail" class="form-control" placeholder="이미지" onchange="readURL(this);"
                                    required="required" aria-required="true">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>상세 계획</label>
                                                <textarea rows="5" name="content" class="form-control" placeholder="작성해주십시오."></textarea>
                                            </div>
                                        </div>
                                    </div>
                        <div class="row">
                            <div class="col-md-5">
                                <label class="col-md-4" for="category">구분</label>
                                <select class="inputModal" type="text" name="category" id="edit-category">
                                    <option value="중요">중요</option>
                                    <option value="필수">필수</option>
                                    <option value="선택">선택</option>
                                </select>
                            </div>
                        </div>                                    
                        <div class="row">
                            <div class="col-md-5">
                                <label class="col-md-4" for="edit-color">색상</label>
                                <select class="inputModal" name="backgroundColor" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                                    <button type="submit" class="btn btn-info btn-fill pull-right">등록하기</button>
                                    <div class="clearfix"></div>
                                </form>
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
                                    <img class="avatar border-gray" id="blah" src="#" alt="..."/>

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

                </div>
            </div>
        </div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>
