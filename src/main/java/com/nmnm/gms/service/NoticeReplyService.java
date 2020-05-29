package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.NoticeReply;

public interface NoticeReplyService {

  void add(NoticeReply noticeReply) throws Exception;

  List<NoticeReply> list() throws Exception;

  int delete(int noticeReplyNo) throws Exception;

  NoticeReply get(int noticeReplyNo) throws Exception;

  int update(NoticeReply noticeReply) throws Exception;
  
  List<NoticeReply> search(String keyword) throws Exception;
}
