<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="com.nmnm.gms.dao.MemberDao" %>
<%@ page import="com.nmnm.gms.util.SHA256" %>
<%@ page import="com.nmnm.gms.util.Gmail" %>>
<%@ page import="java.io.PrintWriter" %>
<%
    MemberDao memberDAo = new MemberDao();
    String email = (String) session.getAttribute("email");
    if (session.getAttribute("email")){
    
    request.setCharacterEncoding("UTF-8");
    String email = null;
    String password = null;
    String name = null;
    String tel = null;
    if(request.getParameter("email") != null){
      email = request.getParameter("email");
    }
    if(request.getParameter("password") != null){
      password = request.getParameter("password");
    }
    if(request.getParameter("name") != null){
      name = request.getParameter("name");
    }
    if(request.getParameter("tel") != null){
      tel = request.getParameter("tel");
    }
    if(email == null || password == null || name == null || tel == null){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('입력이 안 된 사항이 있습니다.');");
      script.println("history.back()");
      script.println("</script>");
      script.close();
      return;
    }

    MemberDao memberDao = new MemberDao();
    int result = memberDao.join(new Member(email, password, name, tel,  SHA256.getSHA256(email), false));
    if(result == -1){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('이미 존재하는 이메일 입니다.');");
      script.println("history.back()");
      script.println("</script>");
      script.close();
    } else{
      session.setAttribute("email", email);
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("location.href = 'emailSendAction.jsp");
      script.println("</script>");
      script.close();
    }
%>
