package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.Pagination;
import com.nmnm.gms.domain.Co;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface CoDao {
  public int insert(Co co) throws Exception;

  List<Co> findAll() throws Exception;

  public Co findByNo(int communicationBoardNo) throws Exception;

  public int update(Co communicationBoard) throws Exception;

  public int delete(int communicationBoardNo) throws Exception;

  public List<Co> findByKeyword(String keyword) throws Exception;

  public List<Co> findByCategory(String keyword2) throws Exception;

  // 페이징
  public void updateViewCnt(int bid);

  public int listCnt() throws Exception;

  List<Co> findAll(Pagination pagination) throws Exception;
  // public List<Co> getCoList(Pagination pagination) throws Exception;
}


