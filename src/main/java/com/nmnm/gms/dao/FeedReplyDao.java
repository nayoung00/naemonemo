package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.FeedReply;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface FeedReplyDao {
  
  // 댓글 조회
  List<FeedReply> readReply(int feedNo) throws Exception;
  
  // 댓글 작성
  void writeReply(FeedReply feedReply) throws Exception;
  
  // 댓글 수정
  void updateReply(FeedReply feedReply) throws Exception;
  
  // 댓글 삭제
  void deleteReply(FeedReply feedReply) throws Exception; // 왜 인트로 안받지
  
  // 선택된 댓글 조회
  FeedReply selectReply(int feedReplyNo) throws Exception;
}
