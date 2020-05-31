package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.NoticeReply;

public interface NoticeReplyService {
  
  // 댓글 조회
  List<NoticeReply> readReply(int noticeNo) throws Exception;//

  // 댓글 작성
  void writeReply(NoticeReply noticeReply) throws Exception;

  // 댓글 수정
  void updateReply(NoticeReply noticeReply) throws Exception;

  // 댓글 삭제
  void deleteReply(NoticeReply noticeReply) throws Exception; //왜 피드리플라이넘버 인트로 안받지

  // 선택된 댓글 조회
  NoticeReply selectReply(int noticeReplyNo) throws Exception; 


}
