<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="sidebar" data-color="orange" data-image="#">
		<!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->
		<div class="sidebar-wrapper">
        <div class="logo" style="margin:20px 45px;">    
            <a href="../../index.html"> 
            <img src="${pageContext.request.getContextPath()}/logo/logo_white2.png"  width="170" height="50" alt="..." class="logo" >
            </a>
        </div>
        <br>
        <br>
				<ul class="nav">
						<li><a href="../admin/groupadmin?groupNo=${group.groupNo}"
								class="simple-text"> <i class="pe-7s-bell"></i> 모임관리
						</a></li>
						<li><a href="../admin/gmList?groupNo=${group.groupNo}"
								class="simple-text"> <i class="pe-7s-user"></i> 회원관리
						</a></li>
						<li><a href="../admin/boardadmin?groupNo=${group.groupNo}"
								class="simple-text"> <i class="pe-7s-note"></i> 게시판관리
						</a></li>
				</ul>
		</div>
</div>
<style>
</style>