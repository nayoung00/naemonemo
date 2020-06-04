package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.GroupDao;
import com.nmnm.gms.domain.Group;
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
  public int delete(int groupNo) throws Exception {
    return groupDao.delete(groupNo);
  }

  // 모임만들기 버튼으로 모임 생성
  @Override
  public int add(Group group) throws Exception {
    return groupDao.insert(group);
  }



  @Override
  public int update(Group group) throws Exception {
    return groupDao.update(group);
  }

  @Override
  public List<Group> search(String keyword) throws Exception {
    return groupDao.findByKeyword(keyword);
  }

  // 추천 모임 리스트
  @Override
  public List<Group> listByRec() throws Exception {
    return groupDao.listByRec();
  }

  // 신규 모임 리스트
  @Override
  public List<Group> listByCd() throws Exception {
    return groupDao.listByCd();
  }

  // 모임홈 app/moim/home?groupNo=1 
  @Override
  public Group get(int groupNo) throws Exception { //detail등 
    return groupDao.findByNo(groupNo);
  }

  // 멤버가 가입한 모임 리스트
  @Override
  public List<Group> listByJoin() throws Exception {
    return groupDao.listByJoin();
  }





}
