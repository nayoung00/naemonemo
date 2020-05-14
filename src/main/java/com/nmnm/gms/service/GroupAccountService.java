package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.GroupAccount;

public interface GroupAccountService {
  int add(GroupAccount groupAccount) throws Exception;
  int add(Object[] groupAccount);

  List<GroupAccount> list() throws Exception;

  int delete(int groupAccount) throws Exception;

  GroupAccount get(int bankInfoId) throws Exception;

  int update(GroupAccount groupAccount) throws Exception;

  List<GroupAccount> search(String keyword) throws Exception;

}
