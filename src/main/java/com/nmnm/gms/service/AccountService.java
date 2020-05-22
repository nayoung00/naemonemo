package com.nmnm.gms.service;

import java.util.Date;
import java.util.List;
import com.nmnm.gms.domain.Account;

public interface AccountService {

  int add(Account account) throws Exception;

  List<Account> list() throws Exception;

  int delete(int accountNo) throws Exception;

  Account get(int accountNo) throws Exception;

  int update(Account account) throws Exception;

  List<Account> search(String keyword) throws Exception;

  List<Account> search(Date startDate, Date endDate) throws Exception;
  // Map<Account, Date> search(Date startDate, Date endDate) throws Exception;
}
