package com.nmnm.gms.service.impl;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.nmnm.gms.dao.FeedReplyDao;
import com.nmnm.gms.domain.FeedReply;
import com.nmnm.gms.service.FeedReplyService;


@Service
public class FeedReplyServiceImpl implements FeedReplyService {

  @Inject
  FeedReplyDao feedReplyDao;

  // 댓글 조회
  @Override
  public List<FeedReply> readReply(int feedNo) throws Exception {
    return feedReplyDao.readReply(feedNo);
  }
  
  // 댓글 작성
  @Override
  public void writeReply(FeedReply feedReply) throws Exception {
    feedReplyDao.writeReply(feedReply);
  }

  // 댓글 수정
  @Override
  public void updateReply(FeedReply feedReply) throws Exception {
    feedReplyDao.updateReply(feedReply);
  }

  // 댓글 삭제
  @Override
  public void deleteReply(FeedReply feedReply) throws Exception {
    feedReplyDao.deleteReply(feedReply);
  }

  // 선택된 댓글 조회
  @Override
  public FeedReply selectReply(int feedReplyNo) throws Exception {
    return feedReplyDao.selectReply(feedReplyNo);
  }


}
