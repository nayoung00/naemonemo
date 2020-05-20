package com.nmnm.gms.dao;

import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;

public interface MemberDao {
  // 회원가입 email중복체크(+AJAX)
  public int emailCheck(String email);

  // 회원가입 db에 회원등록
  public int insert(Member memeber);

  // 회원수정
  public int update(Member member);

  // 회원가입 진행시 난수 생성및 useyn 컬럼에 난수 입력
  public int getKey(String email, String key);

  // 회원가입 이메일인증후 useyn컬럼y로 값변경
  public int alterKey(String email, String key);

  // 1명의 회원정보
  public Member userView(String email);

  // 비밀번호변경 : 현재 비밀번호 체크
  public String pwCheck(String email);

  // 비밀번호 수정: 실제 DB에 update
  public void pwUpdate(Member member);

  // 회원탈퇴 : authStatus = d
  public int drop(String member);

  public Member login(Member member);

  int send(Message message) throws Exception;

  Member sender(int no) throws Exception;

  Member findgrmember(int grMemberNo) throws Exception; // 그룹 멤버 조회

  int approvalGrMember(GroupMember grMember) throws Exception; // 그룹 가입승인


}
