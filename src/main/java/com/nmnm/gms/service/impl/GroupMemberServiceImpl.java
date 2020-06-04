package com.nmnm.gms.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.GroupMemberDao;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.service.GroupMemberService;

@Component
public class GroupMemberServiceImpl implements GroupMemberService {

  GroupMemberDao groupMemberDao;

	@Override
	public List<GroupMember> list(int groupNo) throws Exception {
		return groupMemberDao.findAll(groupNo);
	}

	@Override
	public int delete(int memberNo) throws Exception {
		return groupMemberDao.delete(memberNo);
	}

	@Override
	public int add(GroupMember groupMember) throws Exception {	
		return groupMemberDao.insert(groupMember);
	}

	@Override
	public GroupMember get(int memberNo) throws Exception {
		return groupMemberDao.findByNo(memberNo);
	}

	@Override
	public int update(GroupMember groupMember) throws Exception {
		return groupMemberDao.update(groupMember);
	}

	@Override
	public List<GroupMember> search(String keyword) throws Exception {
		return groupMemberDao.findByKeyword(keyword);
	}
  
  public GroupMemberServiceImpl(GroupMemberDao groupMemberDao) {
    this.groupMemberDao = groupMemberDao;
  }
}
