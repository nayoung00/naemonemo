package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.FeedReply;

public interface FeedReplyService {
  
  // 댓글 조회
  List<FeedReply> readReply(int feedNo) throws Exception;//

  // 댓글 작성
  void writeReply(FeedReply feedReply) throws Exception;

  // 댓글 수정
  void updateReply(FeedReply feedReply) throws Exception;

  // 댓글 삭제
  void deleteReply(FeedReply feedReply) throws Exception; //왜 피드리플라이넘버 인트로 안받지

  // 선택된 댓글 조회
  FeedReply selectReply(int feedReplyNo) throws Exception; 


}
