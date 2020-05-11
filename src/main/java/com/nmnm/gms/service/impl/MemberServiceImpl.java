package com.nmnm.gms.service.impl;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.MemberDao;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;
import com.nmnm.gms.service.MemberService;

@Component
public class MemberServiceImpl implements MemberService {

  private SqlSession session;

  MemberDao memberDao;


  public MemberServiceImpl(MemberDao memberDao) {
    this.memberDao = memberDao;
  }

  @Override
  public List<Member> list() throws Exception {
    return memberDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return memberDao.delete(no);
  }

  @Override
  public int add(Member member) throws Exception {
    return memberDao.insert(member);
  }

  @Override
  public Member get(int no) throws Exception {
    return memberDao.findByNo(no);
  }

  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    return memberDao.findByEmailAndPassword(params);
  }

  @Override
  public int update(Member member) throws Exception {
    return memberDao.update(member);
  }

  @Override
  public List<Member> search(String keyword) throws Exception {
    return memberDao.findByKeyword(keyword);
  }

  @Override
  public int send(Message message) throws Exception {
    return memberDao.send(message);
  }

  @Override
  public Member sender(int no) throws Exception {
    return memberDao.sender(no);
  }


  // 이메일 중복 검사(AJAX)
  @Override
  public void checkEmail(String email, HttpServletResponse response) throws Exception {
    PrintWriter out = response.getWriter();
    out.println(memberDao.checkEmail(email));
    out.close();
  }

  // 회원가입
  @Override
  public int insertMember(Member member, HttpServletResponse response) throws Exception {
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();

    if (memberDao.checkEmail(member.getEmail()) == 1) {
      out.println("<script>");
      out.println("alert('동일한 이메일이 있습니다.');");
      out.println("history.go(-1);");
      out.println("</script>");
      out.close();
      return 0;
    } else {
      memberDao.insertMember(member);
      return 1;
    }
  }

//  @Override
//  public Member login(Member member, HttpServletResponse response) throws Exception {
//    response.setContentType("text/html;charset=utf-8");
//    PrintWriter out = response.getWriter();
//    // 등록된 아이디가 없으면
//    if (memberDao.checkEmail(member.getEmail()) == 0) {
//      out.println("<script>");
//      out.println("alert('등록된 이메일이 없습니다.');");
//      out.println("history.go(-1);");
//      out.println("</script>");
//      out.close();
//      return null;
//    } else {
//      String pw = member.getPassword();
//      member = memberDao.login(member.getEmail());
//      // 비밀번호가 다를 경우
//      if (!member.getPassword().equals(pw)) {
//        out.println("<script>");
//        out.println("alert('비밀번호가 다릅니다.');");
//        out.println("history.go(-1);");
//        out.println("</script>");
//        out.close();
//        return null;
//        // 이메일 인증을 하지 않은 경우
//      } else if (!member.getApprovalStatus().equals("true")) {
//        out.println("<script>");
//        out.println("alert('이메일 인증 후 로그인 하세요.');");
//        out.println("history.go(-1);");
//        out.println("</script>");
//        out.close();
//        return null;
//        // 로그인 일자 업데이트 및 회원정보 리턴
//      } else {
//        memberDao.updateLog(member.getNo());
//        return member;
//      }
//    }
//  }

}

