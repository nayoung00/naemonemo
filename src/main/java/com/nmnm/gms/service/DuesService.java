package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Dues;
import com.nmnm.gms.domain.Group;

public interface DuesService {

//  int add(Account account) throws Exception;

  List<Dues> list() throws Exception;

//  int delete(int accountNo) throws Exception;

//  Account get(int accountNo) throws Exception;

  int update(Dues groupNo) throws Exception;

	Dues get(int groupNo) throws Exception;

//  List<Account> search(String keyword) throws Exception;

//  List<Account> search(Date startDate, Date endDate) throws Exception;
  // Map<Account, Date> search(Date startDate, Date endDate) throws Exception;
}
