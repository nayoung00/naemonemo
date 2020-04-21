package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.FeedDao;
import com.nmnm.gms.domain.Feed;
import com.nmnm.gms.service.FeedService;

@Component
public class FeedServiceImpl implements FeedService {

  FeedDao feedDao;

  public FeedServiceImpl(FeedDao feedDao) {
    this.feedDao = feedDao;
  }

  @Override
  public int add(Feed feed) throws Exception {
    return feedDao.insert(feed);
  }

  @Override
  public List<Feed> list() throws Exception {
    return feedDao.findAll();
  }

  @Override
  public int delete(int feedNo) throws Exception {
    return feedDao.delete(feedNo);
  }

  @Override
  public Feed get(int feedNo) throws Exception {
    return feedDao.findByNo(feedNo);
  }

  @Override
  public int update(Feed feed) throws Exception {
    return feedDao.update(feed);
  }

}
