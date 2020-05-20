package com.nmnm.gms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
public interface MemberDao {
  int insert(Member member) throws Exception;

  List<Member> findAll() throws Exception;

  Member findByNo(int no) throws Exception;

  int update(Member member) throws Exception;

  int delete(int no) throws Exception;

  List<Member> findByKeyword(String keyword) throws Exception;

  Member findByEmailAndPassword(Map<String, Object> params) throws Exception;

  int login(Member member) throws Exception;

  int join(Member member) throws Exception;

  int send(Message message) throws Exception;

  Member sender(int no) throws Exception;

  // ID 중복체크
  int checkid(String email) throws Exception;

  // nickname 중복체크
  int checknick(String nickname) throws Exception;

  int selectMemberNo(String email) throws Exception;

  int alterKey(Map<String, Object> params); // 유저 인증키 생성 메서드

  int alterUserkey(Map<String, Object> params); // 유저 인증키 Y로 바꿔주는 메서드

  void updatePassword(HashMap<String, Object> params) throws Exception;

  Member findgrmember(int grMemberNo) throws Exception; // 그룹 멤버 조회

  int approvalGrMember(GroupMember grMember) throws Exception; // 그룹 가입승인

}
