package com.nmnm.gms.dao;

import java.util.List;
import java.util.Map;
import com.nmnm.gms.domain.Feed;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface FeedDao {

  int insert(Feed feed) throws Exception;

  List<Feed> findAll() throws Exception;

  Feed findByNo(int no) throws Exception;

  int update(Feed lesson) throws Exception;

  int delete(int no) throws Exception;

  List<Feed> findByKeyword(Map<String, Object> params) throws Exception;
}


