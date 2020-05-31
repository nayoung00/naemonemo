package com.nmnm.gms.service.impl;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.nmnm.gms.dao.CoReplyDao;
import com.nmnm.gms.domain.CoReply;
import com.nmnm.gms.service.CoReplyService;


@Service
public class CoReplyServiceImpl implements CoReplyService {

  @Inject
  CoReplyDao coReplyDao;

  // 댓글 조회
  @Override
  public List<CoReply> readReply(int coNo) throws Exception {
    return coReplyDao.readReply(coNo);
  }
  
  // 댓글 작성
  @Override
  public void writeReply(CoReply coReply) throws Exception {
    coReplyDao.writeReply(coReply);
  }

  // 댓글 수정
  @Override
  public void updateReply(CoReply coReply) throws Exception {
    coReplyDao.updateReply(coReply);
  }

  // 댓글 삭제
  @Override
  public void deleteReply(CoReply coReply) throws Exception {
    coReplyDao.deleteReply(coReply);
  }

  // 선택된 댓글 조회
  @Override
  public CoReply selectReply(int coReplyNo) throws Exception {
    return coReplyDao.selectReply(coReplyNo);
  }


}
