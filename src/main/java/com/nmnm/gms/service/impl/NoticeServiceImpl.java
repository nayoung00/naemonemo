package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.NoticeDao;
import com.nmnm.gms.domain.Notice;
import com.nmnm.gms.service.NoticeService;

@Component
public class NoticeServiceImpl implements NoticeService {
  
  NoticeDao noticeDao;

  public NoticeServiceImpl(NoticeDao noticeDao) {
    this.noticeDao = noticeDao;
  }

  @Override
  public void add(Notice notice) throws Exception {
    noticeDao.insert(notice);
  }

  @Override
  public List<Notice> list() throws Exception {
    return noticeDao.findAll();
  }

  @Override
  public int delete(int noticeNo) throws Exception {
    return noticeDao.delete(noticeNo);
  }

  @Override
  public Notice get(int noticeNo) throws Exception {
    return noticeDao.findByNo(noticeNo);
  }

  @Override
  public int update(Notice notice) throws Exception {
    return noticeDao.update(notice);
  }

  @Override
  public List<Notice> search(String keyword) throws Exception {
    return noticeDao.findByKeyword(keyword);
  }


}
