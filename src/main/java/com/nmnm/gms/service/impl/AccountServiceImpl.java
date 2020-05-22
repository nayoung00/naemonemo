package com.nmnm.gms.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.AccountDao;
import com.nmnm.gms.domain.Account;
import com.nmnm.gms.service.AccountService;

@Component
public class AccountServiceImpl implements AccountService {

  AccountDao accountDao;

  public AccountServiceImpl(AccountDao accountDao) {
    this.accountDao = accountDao;
  }


  @Override
  public int add(Account account) throws Exception {
    return accountDao.insert(account);
  }

  @Override
  public List<Account> list() throws Exception {
    return accountDao.findAll();
  }

  @Override
  public int delete(int accountNo) throws Exception {
    return accountDao.delete(accountNo);
  }

  @Override
  public Account get(int accountNo) throws Exception {
    return accountDao.findByNo(accountNo);
  }

  @Override
  public int update(Account account) throws Exception {
    return accountDao.update(account);
  }

  @Override
  public List<Account> search(String keyword) throws Exception {
    return accountDao.findByKeyword(keyword);
  }

  @Override
  public List<Account> search(Date startDate, Date endDate) throws Exception {
    return accountDao.findByDate(startDate, endDate);
  }
  // @Override
  // public Map<Account, Date> search(Date startDate, Date endDate) throws Exception {
  // return (Map<Account, Date>) accountDao.findByDate(startDate, endDate);
  // }

}
