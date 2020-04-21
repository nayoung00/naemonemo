package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Feed;

public interface FeedService {

  List<Feed> list() throws Exception;

  int delete(int feedNo) throws Exception;

  int add(Feed feed) throws Exception;

  Feed get(int feedNo) throws Exception;

  int update(Feed feed) throws Exception;

}
