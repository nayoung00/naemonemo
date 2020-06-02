package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Group;
import com.nmnm.gms.domain.GroupMember;

public interface GroupService {

  // 모든 모임 리스트
  List<Group> list() throws Exception;
  
  // 멤버가 가입한 모임 리스트
  List<Group> listByJoin() throws Exception;
  
  // 추천 모임 리스트
  List<Group> listByRec() throws Exception;
  
  // 신규 모임 리스트 
  List<Group> listByCd() throws Exception;
  
  // 모임홈 app/moim/home?groupNo=1 
  Group get(int groupNo) throws Exception; // 구 detail

  // 모임관리에서 쓸 모임 삭제
  int delete(int groupNo) throws Exception;

  // 모임만들기 버튼으로 모임 생성
  int add(Group group) throws Exception;

  // 모임관리에서 모임정보업데이트시 사용할 서비스
  int update(Group group) throws Exception;

  // 모임검색
  List<Group> search(String keyword) throws Exception;

}
