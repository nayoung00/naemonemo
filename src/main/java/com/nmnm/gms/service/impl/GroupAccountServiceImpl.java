package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.GroupAccountDao;
import com.nmnm.gms.domain.GroupAccount;
import com.nmnm.gms.service.GroupAccountService;

@Component
public class GroupAccountServiceImpl implements GroupAccountService {

  GroupAccountDao groupAccountDao;

  public GroupAccountServiceImpl(GroupAccountDao groupAccountDao) {
    this.groupAccountDao = groupAccountDao;
  }


  @Override
  public int add(GroupAccount groupAccount) throws Exception {
    return groupAccountDao.insert(groupAccount);
  }


  @Override
  public List<GroupAccount> list() throws Exception {
    return groupAccountDao.findAll();
  }

  @Override
  public int delete(int bankInfoId) throws Exception {
    return groupAccountDao.delete(bankInfoId);
  }

  @Override
  public GroupAccount get(int bankInfoId) throws Exception {
    return groupAccountDao.findByNo(bankInfoId);
  }

  @Override
  public int update(GroupAccount groupAccount) throws Exception {
    return groupAccountDao.update(groupAccount);
  }

  @Override
  public List<GroupAccount> search(String keyword) throws Exception {
    return groupAccountDao.findByKeyword(keyword);
  }
}
