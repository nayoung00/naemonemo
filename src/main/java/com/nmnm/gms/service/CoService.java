package com.nmnm.gms.service;

import java.util.List;
import java.util.Map;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.nmnm.gms.Pagination;
import com.nmnm.gms.domain.Co;

public interface CoService {

  void add(Co co, MultipartHttpServletRequest mpRequest) throws Exception;

  List<Co> list() throws Exception;

  List<Co> list(Pagination pagination) throws Exception;

  void delete(int coNo) throws Exception; //int

  Co get(int coNo) throws Exception;

  // 게시물 수정 + 첨부파일 수정
  void update(Co co, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;

  List<Co> search(String keyword) throws Exception;

  List<Co> categorySearch(String keyword2) throws Exception;

  // 페이징
  Co getCoContent(int bid) throws Exception;

  public int listCnt() throws Exception;

  // public List<Co> getCoList(Pagination pagination) throws Exception;

  // 게시물 조회수
  public boolean plusCnt(int coNo) throws Exception;
  
  // 첨부파일 조회
  public List<Map<String, Object>> selectFileList(int bno) throws Exception;
  
  // 첨부파일 다운
  public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
}
