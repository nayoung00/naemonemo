package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.Notice;

public interface NoticeDao {
   int insert(Notice notice) throws Exception;

   List<Notice> findAll() throws Exception;

   Notice findByNo(int noticeBoardNo) throws Exception;

   int update(Notice notice) throws Exception;

   int delete(int noticeBoardNo) throws Exception;
   
   List<Notice> findByKeyword(String keyword) throws Exception;
}
