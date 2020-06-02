package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.Group;
import com.nmnm.gms.domain.GroupMember;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface GroupDao {

  int insert(Group group) throws Exception;

  List<Group> findAll() throws Exception;

  Group findByNo(int groupNo) throws Exception;

  int update(Group group) throws Exception;

  int delete(int no) throws Exception;

  List<Group> findByKeyword(String keyword) throws Exception;

  int insertGrMember(GroupMember grMember) throws Exception; // 그룹 가입신청
  
  // 모임홈 app/moim/home?groupNo=
  Group home(int groupNo) throws Exception;
  
  // 추천 모임 리스트 - 배열 0번 그룹 부터 추출 / mapper에서 로그인한 멤버의 interest스트링 검색 sql로 조건설정
  List<Group> listByRec() throws Exception;
  
  // 신규 모임 리스트
  List<Group> listByCd() throws Exception;
}
