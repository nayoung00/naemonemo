package com.nmnm.gms.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.nmnm.gms.Pagination;
import com.nmnm.gms.dao.CoDao;
import com.nmnm.gms.domain.Co;
import com.nmnm.gms.service.CoService;
import com.nmnm.gms.util.FileUtils;

@Component
public class CoServiceImpl implements CoService {

//  @Resource(name="fileUtils")
  private FileUtils fileUtils;

  TransactionTemplate transactionTemplate;
  CoDao coDao;


  public CoServiceImpl( //
      PlatformTransactionManager txManager, //
      CoDao coDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.coDao = coDao;
  }

  // 게시물 추가 + 첨부파일 업로드
  @Transactional
  @Override
  public void add(Co co, MultipartHttpServletRequest mpRequest) throws Exception {
    coDao.insert(co);

    System.out.println(co);
    System.out.println(fileUtils);
    List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(co, mpRequest);
    int size = list.size();
    for (int i = 0; i < size; i++) {
      coDao.insertFile(list.get(i));
    }
  }

  @Transactional
  @Override
  public List<Co> list() throws Exception {
    return coDao.findAll();
  }

  @Override
  public List<Co> list(Pagination pagination) throws Exception {
    return coDao.findAll(pagination);
  }

  @Override
  public int listCnt() throws Exception {
    return coDao.listCnt();
  }

  @Transactional
  @Override
  public void delete(int coNo) throws Exception {
    if (coDao.delete(coNo) == 0) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }
  }

  @Transactional
  @Override
  public Co get(int coNo) throws Exception {
    return coDao.findByNo(coNo);
  }

  // 게시물 수정 + 첨부파일 수정
  @Transactional
  @Override
  public void update(Co co, String[] files, String[] fileNames,
      MultipartHttpServletRequest mpRequest) throws Exception {
    coDao.update(co);

    List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(co, files, fileNames, mpRequest);
    Map<String, Object> tempMap = null;
    int size = list.size();
    for (int i = 0; i < size; i++) {
      tempMap = list.get(i);
      if (tempMap.get("IS_NEW").equals("1")) {
        coDao.insertFile(tempMap);
      } else {
        coDao.updateFile(tempMap);
      }
    }
  }

  @Override
  public List<Co> search(String keyword) throws Exception {
    return coDao.findByKeyword(keyword);
  }

  @Override
  public List<Co> categorySearch(String keyword2) throws Exception {
    return coDao.findByCategory(keyword2);
  }

  // 페이징
  @Override
  public Co getCoContent(int bid) throws Exception {
    Co co = new Co();
    coDao.updateViewCnt(bid);
    return co;
  }


  // 게시물 조회수
  @Transactional(isolation = Isolation.READ_COMMITTED)
  @Override
  public boolean plusCnt(int coNo) throws Exception {
    return coDao.plusCnt(coNo);
  }

  // 첨부파일 조회
  @Override
  public List<Map<String, Object>> selectFileList(int bno) throws Exception {
    return coDao.selectFileList(bno);
  }

  // 첨부파일 다운로드
  @Override
  public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
    return coDao.selectFileInfo(map);
  }

}
