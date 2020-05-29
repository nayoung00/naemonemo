package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.nmnm.gms.dao.NoticeDao;
import com.nmnm.gms.dao.NoticePhotoDao;
import com.nmnm.gms.domain.Notice;
import com.nmnm.gms.service.NoticeService;

@Component
public class NoticeServiceImpl implements NoticeService {
  
  TransactionTemplate transactionTemplate;
  NoticeDao noticeDao;
  NoticePhotoDao noticePhotoDao;
  
  public NoticeServiceImpl(//
      PlatformTransactionManager txManager, //      
      NoticeDao noticeDao, //
      NoticePhotoDao noticePhotoDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);    
    this.noticeDao = noticeDao;
    this.noticePhotoDao = noticePhotoDao;
  }

  @Transactional
  @Override
  public void add(Notice notice) throws Exception {
    if (noticeDao.insert(notice) == 0) {
      throw new Exception("공지사항 등록에 실패했습니다.");
    }
    System.out.println("공지사항 등록  완료#" + notice.getNoticeNo());
    noticePhotoDao.insert(notice);
  }

  @Transactional
  @Override
  public List<Notice> list() throws Exception {
    return noticeDao.findAll();
  }

  @Transactional
  @Override
  public Notice get(int noticeNo) throws Exception {
    return noticeDao.findByNo(noticeNo);
  }


  @Transactional 
  @Override
  public void update(Notice notice) throws Exception {
    if (noticeDao.update(notice) == 0) {
      throw new Exception("공지사항 변경에 실패했습니다.");
    }
    if (notice.getNoticePhotos() != null) {
      noticePhotoDao.deleteAll(notice.getNoticeNo());
      noticePhotoDao.insert(notice);
    }
  }

  @Transactional
  @Override
  public void delete(int noticeNo) throws Exception {
    noticePhotoDao.deleteAll(noticeNo);
    if (noticeDao.delete(noticeNo) == 0) {
      throw new Exception("해당 번호의 공지사항이 없습니다.");
    }
  }

  @Override
  public List<Notice> search(String keyword) throws Exception {
    return noticeDao.findByKeyword(keyword);
  }

}
