package com.nmnm.gms.service;

import javax.servlet.http.HttpSession;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;

public interface MemberService {

  // 회원가입 email중복체크(AJAX)
  public int emailCheck(String email);

  // 회원가입 (DB 에 등록)
  public int insert(Member member);

  // 회원수정 (DB에 수정)
  public void update(Member member, HttpSession session);

  // 1명의 회원정보
  public Member userView(String email);

  // 비밀번호 수정: 현재 비밀번호 체크
  public int pwCheck(String email, String pw);

  // 비밀번호 수정: 실제 DB에 update
  public void pwUpdate(Member member);

  // 회원탈퇴 : userkey = n
  public void drop(HttpSession session, String email);

  Member searchGrMember(int grMemberNo) throws Exception;

  int addGrMember(GroupMember grMember) throws Exception; // 그룹 회원 추가

  int approvalGrMember(GroupMember grMember) throws Exception; // 그룹 가입승인

  public int send(Message message) throws Exception;

  Object sender(int no) throws Exception;

  // 로그인
  int login(Member member, HttpSession session) throws Exception;

  // 로그아웃
  void logout(HttpSession session) throws Exception;

  public int update(Member member) throws Exception;

  public Object get(int no);

  public Object list();

  public Object search(String keyword);



}
