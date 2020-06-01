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
  public int delete(int groupNo) throws Exception {
    return groupAccountDao.delete(groupNo);
  }

  @Override
  public GroupAccount get(int groupNo) throws Exception {
    return groupAccountDao.findByNo(groupNo);
  }

  @Override
  public void update(GroupAccount groupAccount) throws Exception{
	  System.out.println("111111");
	  groupAccountDao.update(groupAccount);
  }
  
//  @Override
//  public void update(
//		  int bankInfoId, 
//		  int groupNo, 
//		  int bankAccountNo, 
//		  String bankName, 
//		  String bankAccountHolder) throws Exception {
//	  System.out.println("서비스 impl");
	  
//	  GroupAccount groupAccount = new GroupAccount;
//	  groupAccount =
	  
//    return groupAccountDao.update(groupAccount);
  

  @Override
  public List<GroupAccount> search(String keyword) throws Exception {
    return groupAccountDao.findByKeyword(keyword);
  }


}
