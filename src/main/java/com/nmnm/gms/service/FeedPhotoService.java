package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.FeedPhoto;

public interface FeedPhotoService {

  int add(FeedPhoto feedPhoto) throws Exception;

  List<FeedPhoto> list(int feedNo) throws Exception;

  FeedPhoto get(int feedPhotoNo) throws Exception;

  int update(FeedPhoto feedPhoto) throws Exception;

  int delete(int feedPhotoNo) throws Exception;

  //List<FeedPhoto> search(String keyword) throws Exception;

}
