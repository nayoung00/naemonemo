package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Group;

public interface GroupService {

  List<Group> list() throws Exception;

  int delete(int no) throws Exception;

  int add(Group group) throws Exception;

  Group get(int no) throws Exception;

  int update(Group group) throws Exception;

  List<Group> search(String keyword) throws Exception;
}
