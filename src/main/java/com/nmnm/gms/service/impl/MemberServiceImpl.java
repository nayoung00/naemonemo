package com.nmnm.gms.service.impl;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.MemberDao;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;
import com.nmnm.gms.service.MemberService;

@Component
public class MemberServiceImpl implements MemberService {

  @Autowired
  private MemberDao memberDao;

  @Autowired
  PasswordEncoder passwordEncoder;


  @Override
  public Member searchGrMember(int grMemberNo) throws Exception {
    return memberDao.findgrmember(grMemberNo);
  }

  @Override
  public int addGrMember(GroupMember grMember) throws Exception {
    return memberDao.insertGrMember(grMember);
  }

  @Override
  public int approvalGrMember(GroupMember grMember) throws Exception {
    return memberDao.approvalGrMember(grMember);
  }

  @Override
  public int emailCheck(String email) {
    return memberDao.emailCheck(email);
  }

  @Override
  public int insert(Member member) {
    return memberDao.insert(member);
  }

  @Override
  public void update(Member member, HttpSession session) {
    int result = memberDao.update(member);
    if (result > 0) { // 수정성공
      // 세션에 로그인유저 정보를 수정된 정보로 변경
      session.removeAttribute("name");
      session.setAttribute("name", member.getName());
    }

  }

  @Override
  public Member userView(String email) {
    return memberDao.userView(email);
  }

  @Override
  public int pwCheck(String email, String pw) {
    String encpw = memberDao.pwCheck(email);
    int result = 0;
    if (passwordEncoder.matches(pw, encpw)) {
      result = 1;
    }
    return result;
  }

  @Override
  public void pwUpdate(Member member) {
    memberDao.pwUpdate(member);
  }

  @Override
  public void drop(HttpSession session, String email) {
    int result = memberDao.drop(email);
    if (result > 0)
      session.invalidate();
  }

  @Override
  public int send(Message message) throws Exception {
    return memberDao.send(message);
  }

  @Override
  public Object sender(int no) throws Exception {
    return memberDao.sender(no);
  }

  @Override
  public int login(Member member, HttpSession session) throws Exception {
    Member login = memberDao.login(member);

    // result 결과
    // 0: 등록된 회원 아님
    // 1: 로그인 성공
    // 2: 이메일인증 하기
    // 3: 아이디나 비밀번호 없거나,불일치
    int result = 0; // 로그인 결과값

    // 2. DB 결과에 따라 동작
    // id가 없는 경우 ( 회원이 아닌 경우)
    if (login == null) {
      result = 0;
      return result;
    }
    // - 회원탈퇴한 경우
    if (member.getUserkey().equals("d")) {
      result = 3;
      return result;
    }
    // - 회원인데 인증을 안한 경우 (n이나 난수인 경우)
    if (!(member.getUserkey().equals("y"))) {
      result = 2;
      return result;
    }
    if (member != null) {
      // 아이디와 패스워드가 같은지 체크
      if (passwordEncoder.matches(member.getPassword(), member.getPassword())) {
        result = 1;
        session.removeAttribute("email");
        session.removeAttribute("name");
        session.setAttribute("email", member.getEmail());
        session.setAttribute("name", member.getName());

        // id가 있는데 pw가 틀린 경우
      } else {
        result = 3;
      }
    }

    return result;
  }

  @Override
  public void logout(HttpSession session) throws Exception {
    session.invalidate();
  }

  public int approvalGrMember(GroupMember grMember) throws Exception {
    return memberDao.approvalGrMember(grMember);
  }
}
