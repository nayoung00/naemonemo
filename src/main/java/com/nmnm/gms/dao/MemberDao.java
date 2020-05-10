package com.nmnm.gms.dao;

import java.util.List;
import java.util.Map;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface MemberDao {

  int insert(Member member) throws Exception;

  List<Member> findAll() throws Exception;

  Member findByNo(int no) throws Exception;

  int update(Member member) throws Exception;


  int delete(int no) throws Exception;

  List<Member> findByKeyword(String keyword) throws Exception;

  Member findByEmailAndPassword(Map<String, Object> params) throws Exception;

  int send(Message message) throws Exception;

  Member sender(int no) throws Exception;


  int checkEmail(String email) throws Exception;

  void insertMember(Member member) throws Exception;

}
