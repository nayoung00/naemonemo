package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.nmnm.gms.dao.FeedDao;
import com.nmnm.gms.dao.FeedPhotoDao;
import com.nmnm.gms.domain.Feed;
import com.nmnm.gms.service.FeedService;


@Component
public class FeedServiceImpl implements FeedService {

  TransactionTemplate transactionTemplate;
  FeedDao feedDao;
  FeedPhotoDao feedPhotoDao;

  public FeedServiceImpl( //
      PlatformTransactionManager txManager, //
      FeedDao feedDao, //
      FeedPhotoDao feedPhotoDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.feedDao = feedDao;
    this.feedPhotoDao = feedPhotoDao;
  }

  
  @Transactional
  @Override
  public void add(Feed feed) throws Exception {
    if (feedDao.insert(feed) == 0) {
      throw new Exception("사진 게시글 등록에 실패했습니다.");
    }
    feedPhotoDao.insert(feed);
  }

  @Transactional
  @Override
  public List<Feed> list() throws Exception {
    return feedDao.findAll();
  }
  
  @Transactional
  @Override
  public Feed get(int feedNo) throws Exception {
    return feedDao.findByNo(feedNo);
  }
  
  @Transactional 
  @Override
  public void update(Feed feed) throws Exception {
    if (feedDao.update(feed) == 0) {
      throw new Exception("사진 게시글 변경에 실패했습니다.");
    }
    if (feed.getFeedPhotos() != null) {
      feedPhotoDao.deleteAll(feed.getFeedNo());
      feedPhotoDao.insert(feed);
    }
  }

  
  @Transactional
  @Override
  public void delete(int feedNo) throws Exception {
    feedPhotoDao.deleteAll(feedNo);
    if (feedDao.delete(feedNo) == 0) {
      throw new Exception("해당 번호의 사진 게시글이 없습니다.");
    }
  }


  @Override
  public List<Feed> search(String keyword) throws Exception {
    return feedDao.findByKeyword(keyword);
  }

}
