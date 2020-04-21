package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.Notice;

public interface NoticeDao {
  public int insert(Notice notice) throws Exception;

  public List<Notice> findAll() throws Exception;

  public Notice findByNo(int noticeBoardNo) throws Exception;

  public int update(Notice board) throws Exception;

  public int delete(int noticeBoardNo) throws Exception;
}
