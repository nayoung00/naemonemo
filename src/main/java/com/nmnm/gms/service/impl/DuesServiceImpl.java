package com.nmnm.gms.service.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.nmnm.gms.dao.DuesDao;
import com.nmnm.gms.domain.Dues;
import com.nmnm.gms.domain.Group;
import com.nmnm.gms.service.DuesService;

@Component
public class DuesServiceImpl implements DuesService {

  DuesDao duesDao;
  
  public DuesServiceImpl(DuesDao duesDao) {
    this.duesDao = duesDao;
  }


//  @Override
//  public int add(Account account) throws Exception {
//    return accountDao.insert(account);
//  }

  @Override
  public List<Dues> list() throws Exception {
    return duesDao.findAll();
  }

//  @Override
//  public int delete(int accountNo) throws Exception {
//    return accountDao.delete(accountNo);
//  }
//
//  @Override
//  public Account get(int accountNo) throws Exception {
//    return accountDao.findByNo(accountNo);
//  }

  @Override
  public int update(Dues groupNo) throws Exception {
    return duesDao.update(groupNo);
  }


	@Override
	public Dues get(int groupNo) throws Exception{
		return duesDao.findByNo(groupNo);
	}

//  @Override
//  public List<Account> search(String keyword) throws Exception {
//    return accountDao.findByKeyword(keyword);
//  }
//
//  @Override
//  public List<Account> search(Date startDate, Date endDate) throws Exception {
//	  HashMap<String,Object> params = new HashMap<>();
//	  if (startDate != null) {
//		  params.put("startDate", df.format(startDate));
//	  }
//	  if (endDate != null) {
//		  params.put("endDate", df.format(endDate));
//	  }
//    return accountDao.findByDate(params);
//  }
//  // @Override
//  // public Map<Account, Date> search(Date startDate, Date endDate) throws Exception {
//  // return (Map<Account, Date>) accountDao.findByDate(startDate, endDate);
//  // }

}
