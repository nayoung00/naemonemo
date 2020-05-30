package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.Co;
import com.nmnm.gms.domain.CoPhoto;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface CoPhotoDao {

  int insert(Co co) throws Exception;
  
  List<CoPhoto> findAll(int coNo) throws Exception;

  int deleteAll(int coNo) throws Exception;

}
