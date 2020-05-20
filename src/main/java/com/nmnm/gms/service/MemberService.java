package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;

public interface MemberService {


  List<Member> list() throws Exception;

  int delete(int no) throws Exception;

  int add(Member member) throws Exception;

  Member get(int no) throws Exception;

  Member get(String email, String password) throws Exception;

  List<Member> search(String keyword) throws Exception;

  int update(Member member) throws Exception;

  int join(Member member) throws Exception;

  int send(Message message) throws Exception;

  Member sender(int no) throws Exception;

  Integer checkid(String email) throws Exception;

  Integer checknick(String nickname) throws Exception;

  int updatePassword(int memberNo, String newPassword, String password) throws Exception;

  String getEmailByEmail(String email);

  Member searchGrMember(int grMemberNo) throws Exception;

  int approvalGrMember(GroupMember grMember) throws Exception; // 그룹 가입승인

}
