package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.GroupMember;

public interface GroupMemberService {

  List<GroupMember> list(int groupNumber) throws Exception;
  
  int delete(int memberNo) throws Exception;

  // 회원 초대(추가)
  int add(GroupMember groupMember) throws Exception;

  GroupMember get(int memberNo) throws Exception;

  // register 변경
  int update(GroupMember groupMember) throws Exception;

  
  List<GroupMember> search(String keyword) throws Exception;
}