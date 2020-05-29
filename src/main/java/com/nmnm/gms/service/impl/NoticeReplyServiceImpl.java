package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.NoticeReplyDao;
import com.nmnm.gms.domain.NoticeReply;
import com.nmnm.gms.service.NoticeReplyService;

@Component
public class NoticeReplyServiceImpl implements NoticeReplyService {
  
  NoticeReplyDao noticeReplyDao;
 
  public NoticeReplyServiceImpl(NoticeReplyDao noticeReplyDao) {
    this.noticeReplyDao = noticeReplyDao;
  }

  @Override
  public void add(NoticeReply noticeReply) throws Exception {
    noticeReplyDao.insert(noticeReply);
  }
  
  @Override
  public List<NoticeReply> list() throws Exception {
    return noticeReplyDao.findAll();
  }
  
  @Override
  public int delete(int noticeReplyNo) throws Exception {
    return noticeReplyDao.delete(noticeReplyNo);
  }
  
  @Override
  public NoticeReply get(int noticeReplyNo) throws Exception {
    return noticeReplyDao.findByNo(noticeReplyNo);
  }
  
  @Override
  public int update(NoticeReply noticeReply) throws Exception {
    return noticeReplyDao.update(noticeReply);
  }
  
  @Override
  public List<NoticeReply> search(String keyword) throws Exception {
    return noticeReplyDao.findByKeyword(keyword);
  }
 

}
