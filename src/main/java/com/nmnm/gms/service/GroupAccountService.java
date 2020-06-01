package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.GroupAccount;

public interface GroupAccountService {
  int add(GroupAccount groupAccount) throws Exception;

  List<GroupAccount> list() throws Exception;

  int delete(int groupNo) throws Exception;

  GroupAccount get(int groupNo) throws Exception;

  void update(GroupAccount groupAccount) throws Exception;

  List<GroupAccount> search(String keyword) throws Exception;

//void update(int bankInfoId, int groupNo, int bankAccountNo, String bankName, String bankAccountHolder) throws Exception;


}
