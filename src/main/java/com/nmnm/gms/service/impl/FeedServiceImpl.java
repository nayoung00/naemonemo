package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.nmnm.gms.dao.FeedDao;
import com.nmnm.gms.dao.FeedPhotoDao;
import com.nmnm.gms.domain.Feed;
import com.nmnm.gms.domain.FeedPhoto;
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
  public int add(Feed feed) throws Exception {
    int result = feedDao.insert(feed);
    if (result == 0) {
      throw new Exception("게시글 추가에 실패했습니다.");
    } else {
      List<FeedPhoto> feedPhotos = feed.getFeedPhotos();
      for (FeedPhoto feedPhoto : feedPhotos) {
        feedPhoto.setFeed(feed);
        if (feedPhotoDao.insert(feedPhoto) == 0) {
          throw new Exception("사진 추가에 실패했습니다.");
        }
      }
    }
    return result;
  }

  @Transactional
  @Override
  public List<Feed> list() throws Exception {
    List<Feed> feeds = feedDao.findAll();
    for (Feed feed : feeds) {
      feed.setFeedPhotos(feedPhotoDao.findAllByFeedNo(feed.getFeedNo()));
    }
    return feeds;
  }
  
  @Transactional
  @Override
  public Feed get(int feedNo) throws Exception {
    Feed feed = feedDao.findByNo(feedNo);
    feed.setFeedPhotos(feedPhotoDao.findAllByFeedNo(feed.getFeedNo()));
    return feedDao.findByNo(feedNo);
  }
  
  @Transactional 
  @Override
  public int update(Feed feed) throws Exception {
    return feedDao.update(feed);
  }

  
  @Transactional
  @Override
  public int delete(int feedNo) throws Exception {
    List<FeedPhoto> feedPhotos = feedPhotoDao.findAllByFeedNo(feedNo);
    for (FeedPhoto feedPhoto : feedPhotos) {
      feedPhotoDao.delete(feedPhoto.getFeedPhotoNo());
    }
    return feedDao.delete(feedNo);
  }


  @Override
  public List<Feed> search(String keyword) throws Exception {
    return feedDao.findByKeyword(keyword);
  }

}
