package com.nmnm.gms.dao;

import java.util.List;

import com.nmnm.gms.domain.Dues;
import com.nmnm.gms.domain.Group;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface DuesDao {

//  int insert(Account account) throws Exception;

  List<Dues> findAll() throws Exception;


//  Account findByNo(int accountNo) throws Exception;

  int update(Group groupNo) throws Exception;

//  int delete(int accountNo) throws Exception;

//  List<Account> findByKeyword(String keyword) throws Exception;

//  List<Account> findByDate(Map<String,Object> params) throws Exception;

}
