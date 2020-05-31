package com.nmnm.gms.dao;

import java.util.Map;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;

public interface MemberDao {
  // 회원가입 email중복체크
  int emailCheck(String email) throws Exception;

  // 회원가입 db에 회원등록
  int insert(Member memeber) throws Exception;

  // 회원수정
  int update(Member member) throws Exception;

  // 회원가입 진행시 난수 생성및 useyn 컬럼에 난수 입력
  void createAuthKey(String email, String userkey) throws Exception;

  // 회원가입 이메일인증후 useyn컬럼y로 값변경
  int alterKey(String email, String key) throws Exception;

  // 1명의 회원정보
  Member userView(String email) throws Exception;

  // 네이버 로그인 체크
  Member naverLoginCheck(String email) throws Exception;

  // 비밀번호 찾기
  int findPassword(Map<String, Object> params) throws Exception;

  // 비밀번호 초기화를 위한 메일보내기
  void resetPassword(Member member) throws Exception;

  // 비밀번호 바꾸기
  void changePassword(Member member) throws Exception;

  void deleteMember(String member) throws Exception;

  // 로그인
  Member findByEmailAndPassword(Map<String, Object> params) throws Exception;


  int login(Member member) throws Exception;


  int send(Message message) throws Exception;

  Member sender(int no) throws Exception;

  Member findgrmember(int grMemberNo) throws Exception; // 그룹 멤버 조회

  int approvalGrMember(GroupMember grMember) throws Exception; // 그룹 가입승인

  int insertGrMember(GroupMember grMember) throws Exception;

  void userAuth(String email) throws Exception;

  Member getNameForNaverMember(String naverEmail);

  Member findByNo(int no) throws Exception;

  void resetPassword(String name, String email, String newPassword);



}
