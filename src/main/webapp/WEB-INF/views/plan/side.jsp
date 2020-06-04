<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<div class="sidebar" data-color="orange" data-image="#">
      <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->
      <div class="sidebar-wrapper">
        <div class="logo" style="margin:20px 45px;">    
            <a href="/nmnm/app/moim/home?groupNo=${group.groupNo}"> 
            <img src="${pageContext.request.getContextPath()}/images/logo/logo_white2.png"  width="170" height="50" alt="..." class="logo" >
            </a>

        </div>
        <br>
        <br>

            <ul class="nav">
                <li>
                    <a href="calendar?groupNo=${param.groupNo}"> 
                        <i class="pe-7s-#"></i>
                        <p>캘린더</p>
                    </a>
                </li>
                <li>
                    <a href="list?groupNo=${plan.groupNo}">
                        <i class="pe-7s-#"></i>
                        <p>일정게시판</p>
                    </a>
                </li>
            </ul>
      </div>
    </div>