package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.CoReply;

public interface CoReplyService {
  
  // 댓글 조회
  List<CoReply> readReply(int coNo) throws Exception;//

  // 댓글 작성
  void writeReply(CoReply coReply) throws Exception;

  // 댓글 수정
  void updateReply(CoReply coReply) throws Exception;

  // 댓글 삭제
  void deleteReply(CoReply coReply) throws Exception; //왜 피드리플라이넘버 인트로 안받지

  // 선택된 댓글 조회
  CoReply selectReply(int coReplyNo) throws Exception; 


}
