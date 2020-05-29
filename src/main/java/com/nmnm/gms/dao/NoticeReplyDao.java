package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.NoticeReply;

public interface NoticeReplyDao {
   int insert(NoticeReply noticeReply) throws Exception;

   List<NoticeReply> findAll() throws Exception;

   NoticeReply findByNo(int noticeReplyNo) throws Exception;
   
   int update(NoticeReply noticeReply) throws Exception;

   int delete(int noticeReplyNo) throws Exception;
   
   List<NoticeReply> findByKeyword(String keyword) throws Exception;
}
