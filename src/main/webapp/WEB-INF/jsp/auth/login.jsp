<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import ="com.nmnm.gms.dao.MemberDao" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty name="email" property="email" />
<jsp:setProperty name="password" property="password" />
<!DOCTYPE html>

<jsp:include page="../header.jsp" />

<h1>로그인 결과</h1>
<body>
    <%
    MemberDao memberDao = new MemberDao();
    int result = memberDao.login(member.getEmail(), member.getPassword());
    if(result == 1){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href = 'main.jsp'");
      script.println("</script>");
    }
    
    
    %>
</body>

<jsp:include page="../footer.jsp" />