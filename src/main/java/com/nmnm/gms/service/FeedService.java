package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Feed;

public interface FeedService {

  void add(Feed feed) throws Exception;

  List<Feed> list() throws Exception;//

  Feed get(int feedNo) throws Exception;

  void update(Feed feed) throws Exception;

  void delete(int feedNo) throws Exception;

  List<Feed> search(String keyword) throws Exception;

}
