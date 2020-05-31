package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.nmnm.gms.Pagination;
import com.nmnm.gms.dao.CoDao;
import com.nmnm.gms.domain.Co;
import com.nmnm.gms.service.CoService;

@Component
public class CoServiceImpl implements CoService {

  TransactionTemplate transactionTemplate;
  CoDao coDao;


  public CoServiceImpl( //
      PlatformTransactionManager txManager, // 
      CoDao coDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.coDao = coDao;
  }

  
  @Transactional  
  @Override
  public void add(Co co) throws Exception {
    if (coDao.insert(co) == 0) {
      throw new Exception("게시글 등록에 실패했습니다.");     
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

  @Transactional
  @Override
  public void update(Co co) throws Exception {
    if (coDao.update(co) == 0) {
      throw new Exception("게시글 변경에 실패했습니다.");
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



}
