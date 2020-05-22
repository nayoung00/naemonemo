package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import com.nmnm.gms.dao.FeedPhotoDao;
import com.nmnm.gms.domain.FeedPhoto;
import com.nmnm.gms.service.FeedPhotoService;

@Component
public class FeedPhotoServiceImpl implements FeedPhotoService {

  TransactionTemplate transactionTemplate;
  FeedPhotoDao feedPhotoDao;

  public FeedPhotoServiceImpl( //
      PlatformTransactionManager txManager, //
      FeedPhotoDao feedPhotoDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.feedPhotoDao = feedPhotoDao;
  }
  
  
  @Override
  public int add(FeedPhoto feedPhoto) throws Exception {
    return feedPhotoDao.insert(feedPhoto);
  }

  @Override
  public List<FeedPhoto> list(int feedNo) throws Exception {
    return feedPhotoDao.findAllByFeedNo(feedNo);
  }

  @Override
  public FeedPhoto get(int feedPhotoNo) throws Exception {
    return feedPhotoDao.findByNo(feedPhotoNo);
  }

  @Override
  public int update(FeedPhoto feedPhoto) throws Exception {
    return feedPhotoDao.update(feedPhoto);
  }

  @Override
  public int delete(int feedPhotoNo) throws Exception {
    return feedPhotoDao.delete(feedPhotoNo);
  }

 

}
