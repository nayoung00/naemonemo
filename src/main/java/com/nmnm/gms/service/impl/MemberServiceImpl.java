package com.nmnm.gms.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.MemberDao;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;
import com.nmnm.gms.service.MemberService;

@Component
public class MemberServiceImpl implements MemberService {


  MemberDao memberDao;

  public MemberServiceImpl(MemberDao memberDao) {
    this.memberDao = memberDao;
  }


  @Override
  public List<Member> list() throws Exception {
    return memberDao.findAll();
  }

  @Override
  public int delete(int no) throws Exception {
    return memberDao.delete(no);
  }

  @Override
  public int add(Member member) throws Exception {
    return memberDao.insert(member);
  }

  @Override
  public Member get(int no) throws Exception {
    return memberDao.findByNo(no);
  }

  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    return memberDao.findByEmailAndPassword(params);
  }

  @Override
  public List<Member> search(String keyword) throws Exception {
    return memberDao.findByKeyword(keyword);
  }

  @Override
  public int update(Member member) throws Exception {
    return memberDao.update(member);
  }


  @Override
  public int join(Member member) throws Exception {
    return memberDao.join(member);
  }



  @Override
  public int send(Message message) throws Exception {
    return memberDao.send(message);
  }

  @Override
  public Member sender(int no) throws Exception {
    return memberDao.sender(no);
  }


  @Override
  public Integer checkid(String inputId) throws Exception {
    return memberDao.checkid(inputId);
  }

  @Override
  public Integer checknick(String nickname) throws Exception {
    return memberDao.checknick(nickname);
  }


  @Override
  public int updatePassword(int memberNo, String newPassword, String password) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }


  @Override
  public String getEmailByEmail(String email) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Member searchGrMember(int grMemberNo) throws Exception {
    return memberDao.findgrmember(grMemberNo);
  }

  @Override
  public int approvalGrMember(GroupMember grMember) throws Exception {
    return memberDao.approvalGrMember(grMember);
  }
}
