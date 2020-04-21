package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.CommunicationBoardDao;
import com.nmnm.gms.domain.CommunicationBoard;
import com.nmnm.gms.service.CommunicationBoardService;

@Component
public class CommunicationBoardServiceImpl implements CommunicationBoardService {

  CommunicationBoardDao communicationBoardDao;

  public CommunicationBoardServiceImpl(CommunicationBoardDao communicationBoardDao) {
    this.communicationBoardDao = communicationBoardDao;
  }

  @Override
  public void add(CommunicationBoard communicationBoard) throws Exception {
    communicationBoardDao.insert(communicationBoard);
  }

  @Override
  public List<CommunicationBoard> list() throws Exception {
    return communicationBoardDao.findAll();
  }

  @Override
  public int delete(int communicationBoardNo) throws Exception {
    return communicationBoardDao.delete(communicationBoardNo);
  }

  @Override
  public CommunicationBoard get(int communicationBoardNo) throws Exception {
    return communicationBoardDao.findByNo(communicationBoardNo);
  }

  @Override
  public int update(CommunicationBoard communicationBoard) throws Exception {
    return communicationBoardDao.update(communicationBoard);
  }
}
