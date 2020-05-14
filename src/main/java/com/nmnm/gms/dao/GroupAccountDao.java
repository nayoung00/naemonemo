package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.GroupAccount;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
// 모임계좌
public interface GroupAccountDao {

  int insert(GroupAccount groupAccount) throws Exception;
  int insert(Object[] groupAccount);

  List<GroupAccount> findAll() throws Exception;

  GroupAccount findByNo(int bankInfoId) throws Exception;

  int update(GroupAccount groupAccount) throws Exception;

  int delete(int bankInfoId) throws Exception;

  List<GroupAccount> findByKeyword(String keyword) throws Exception;


}
