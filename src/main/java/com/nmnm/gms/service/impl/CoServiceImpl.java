package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.CoDao;
import com.nmnm.gms.domain.Co;
import com.nmnm.gms.service.CoService;

@Component
public class CoServiceImpl implements CoService {

  CoDao coDao;

  public CoServiceImpl(CoDao coDao) {
    this.coDao = coDao;
  }

  @Override
  public void add(Co co) throws Exception {
    coDao.insert(co);
  }

  @Override
  public List<Co> list() throws Exception {
    return coDao.findAll();
  }

  @Override
  public int delete(int coNo) throws Exception {
    return coDao.delete(coNo);
  }

  @Override
  public Co get(int coNo) throws Exception {
    return coDao.findByNo(coNo);
  }

  @Override
  public int update(Co co) throws Exception {
    return coDao.update(co);
  }

  @Override
  public List<Co> search(String keyword) throws Exception {
    return coDao.findByKeyword(keyword);
  }

  @Override
  public List<Co> categorySearch(String keyword2) throws Exception {
    return coDao.findByCategory(keyword2);
  }
}
