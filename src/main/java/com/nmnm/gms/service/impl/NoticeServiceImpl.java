package com.nmnm.gms.service.impl;

import java.util.List;
import com.nmnm.gms.dao.NoticeDao;
import com.nmnm.gms.domain.Notice;
import com.nmnm.gms.service.NoticeService;

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
  public int delete(int noticeBoardNo) throws Exception {
    return noticeDao.delete(noticeBoardNo);
  }

  @Override
  public Notice get(int noticeBoardNo) throws Exception {
    return noticeDao.findByNo(noticeBoardNo);
  }

  @Override
  public int update(Notice notice) throws Exception {
    return noticeDao.update(notice);
  }

}
