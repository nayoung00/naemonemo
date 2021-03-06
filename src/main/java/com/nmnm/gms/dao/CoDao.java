package com.nmnm.gms.dao;

import java.util.List;
import java.util.Map;
import com.nmnm.gms.Pagination;
import com.nmnm.gms.domain.Co;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface CoDao {
  public int insert(Co co) throws Exception;

  List<Co> findAll() throws Exception;

  public Co findByNo(int coNo) throws Exception;

  public int update(Co co) throws Exception;

  public int delete(int coNo) throws Exception;

  public List<Co> findByKeyword(String keyword) throws Exception;

  public List<Co> findByCategory(String keyword2) throws Exception;

  // 페이징
  public void updateViewCnt(int bid);

  public int listCnt() throws Exception;

  List<Co> findAll(Pagination pagination) throws Exception;
  // public List<Co> getCoList(Pagination pagination) throws Exception;
  
  // 게시물 조회수
  public boolean plusCnt(int coNo) throws Exception;
  
  // 첨부파일 업로드 (coMapper : sqlSession.insert("boardMapper.insertFile", map); )
  public void insertFile(Map<String, Object> map) throws Exception;
  
  // 첨부파일 조회 (coMapper: return sqlSession.selectList("boardMapper.selectFileList", bno);)
  public List<Map<String, Object>> selectFileList(int bno) throws Exception;
  
  // 첨부파일 다운로드 (coMapper: return sqlSession.selectOne("boardMapper.selectFileInfo", map);)
  public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
  
  //첨부파일 수정 (coMapper: sqlSession.update("boardMapper.updateFile", map);)
  public void updateFile(Map<String, Object> map) throws Exception;
}


