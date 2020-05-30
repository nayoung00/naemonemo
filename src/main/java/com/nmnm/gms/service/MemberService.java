package com.nmnm.gms.service;

import javax.servlet.http.HttpSession;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;

public interface MemberService {


  // 회원가입 (DB 에 등록)
  void join(Member member) throws Exception;

  // 이메일인증
  public void userAuth(String email) throws Exception;

  // 이메일인증 다시 보내기
  public void emailAgainSend(Member member) throws Exception;

  // 회원수정 (DB에 수정)
  public void update(Member member, HttpSession session) throws Exception;

  // 1명의 회원정보
  public Member userView(String email) throws Exception;

  // 비밀번호 초기화를 위한 메일보내기
  void resetPassword(Member member) throws Exception;

  // 비밀번호 바꾸기
  void changePassword(Member member) throws Exception;

  // 회원탈퇴 : userkey = nc
  public void drop(HttpSession session, String email);

  Member searchGrMember(int grMemberNo) throws Exception;

  int addGrMember(GroupMember grMember) throws Exception; // 그룹 회원 추가

  int approvalGrMember(GroupMember grMember) throws Exception; // 그룹 가입승인

  public int send(Message message) throws Exception;

  Object sender(int no) throws Exception;

  // 로그아웃
  public void logout(HttpSession session) throws Exception;

  public int update(Member member) throws Exception;

  public Object get(int no) throws Exception;

  public Object list();

  public Object search(String keyword);

  Member get(String email, String password) throws Exception;

  Member findAccount(String email) throws Exception;

  // 네이버 로그인 체크 후 정보를 가져오기 위함
  public Member naverLoginCheck(String email) throws Exception;

  public Member getNameForNaverMember(String naverEmail);

  int emailCheck(String email) throws Exception;



}
