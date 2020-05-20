package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.GroupDao;
import com.nmnm.gms.domain.Group;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.service.GroupService;

@Component
public class GroupServiceImpl implements GroupService {

  GroupDao groupDao;

  public GroupServiceImpl(GroupDao groupDao) {
    this.groupDao = groupDao;
  }

  @Override
  public List<Group> list() throws Exception {
    return groupDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return groupDao.delete(no);
  }

  @Override
  public int add(Group group) throws Exception {
    return groupDao.insert(group);
  }

  @Override
  public Group get(int no) throws Exception {
    return groupDao.findByNo(no);
  }


  @Override
  public int update(Group group) throws Exception {
    return groupDao.update(group);
  }

  @Override
  public List<Group> search(String keyword) throws Exception {
    return groupDao.findByKeyword(keyword);
  }

  @Override
  public int addGrMember(GroupMember grMember) throws Exception {
    return groupDao.insertGrMember(grMember);
  }
}
