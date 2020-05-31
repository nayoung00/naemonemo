package com.nmnm.gms.service.impl;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.nmnm.gms.dao.NoticeReplyDao;
import com.nmnm.gms.domain.NoticeReply;
import com.nmnm.gms.service.NoticeReplyService;


@Service
public class NoticeReplyServiceImpl implements NoticeReplyService {

  @Inject
  NoticeReplyDao noticeReplyDao;

  // 댓글 조회
  @Override
  public List<NoticeReply> readReply(int noticeNo) throws Exception {
    return noticeReplyDao.readReply(noticeNo);
  }
  
  // 댓글 작성
  @Override
  public void writeReply(NoticeReply noticeReply) throws Exception {
    noticeReplyDao.writeReply(noticeReply);
  }

  // 댓글 수정
  @Override
  public void updateReply(NoticeReply noticeReply) throws Exception {
    noticeReplyDao.updateReply(noticeReply);
  }

  // 댓글 삭제
  @Override
  public void deleteReply(NoticeReply noticeReply) throws Exception {
    noticeReplyDao.deleteReply(noticeReply);
  }

  // 선택된 댓글 조회
  @Override
  public NoticeReply selectReply(int noticeReplyNo) throws Exception {
    return noticeReplyDao.selectReply(noticeReplyNo);
  }


}
