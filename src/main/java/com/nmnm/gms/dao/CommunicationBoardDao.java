package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.CommunicationBoard;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface CommunicationBoardDao {
  public int insert(CommunicationBoard communicationBoard) throws Exception;

  public List<CommunicationBoard> findAll() throws Exception;

  public CommunicationBoard findByNo(int communicationBoardNo) throws Exception;

  public int update(CommunicationBoard communicationBoard) throws Exception;

  public int delete(int communicationBoardNo) throws Exception;
}


