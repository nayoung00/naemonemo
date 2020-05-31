package com.nmnm.gms.service.impl;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nmnm.gms.dao.CoLikeDao;
import com.nmnm.gms.service.Action;
import com.nmnm.gms.service.ActionForward;

public class RecCount implements Action{

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    
    int no = Integer.parseInt(request.getParameter("no"));
    
    CoLikeDao manager = CoLikeDao.getInstance();
    // 게시글 총 추천수를 구함
    int count = manager.recCount(no);
    // 뷰페이지(boardContent.jsp)에 추천수를 출력하도록 하는 역할
    out.println(count);
    out.close();
    
    return null;
  }


}
