package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.CoReply;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface CoReplyDao {
  
  // 댓글 조회
  List<CoReply> readReply(int coNo) throws Exception;
  
  // 댓글 작성
  void writeReply(CoReply coReply) throws Exception;
  
  // 댓글 수정
  void updateReply(CoReply coReply) throws Exception;
  
  // 댓글 삭제
  void deleteReply(CoReply coReply) throws Exception; 
  
  // 선택된 댓글 조회
  CoReply selectReply(int coReplyNo) throws Exception;
}
