package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Notice;

public interface NoticeService {

  void add(Notice notice) throws Exception;

  List<Notice> list() throws Exception;

  Notice get(int noticeNo) throws Exception;

  void update(Notice notice) throws Exception;

  void delete(int noticeNo) throws Exception;
  
  List<Notice> search(String keyword) throws Exception;
}
