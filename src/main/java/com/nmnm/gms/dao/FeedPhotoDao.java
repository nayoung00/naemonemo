package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.FeedPhoto;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface FeedPhotoDao {

  int insert(FeedPhoto feedPhoto) throws Exception;

  List<FeedPhoto> findAllByFeedNo(int feedNo) throws Exception;

  FeedPhoto findByNo(int feedPhotoNo) throws Exception;

  int update(FeedPhoto feedPhoto) throws Exception;

  int delete(int feedPhotoNo) throws Exception;

  List<FeedPhoto> findByKeyword(String keyword) throws Exception;
}
