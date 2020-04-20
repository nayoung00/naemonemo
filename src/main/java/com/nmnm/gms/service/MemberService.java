package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Member;

public interface MemberService {

  List<Member> list() throws Exception;

  int delete(int no) throws Exception;

  int add(Member member) throws Exception;

  Member get(int no) throws Exception;

  Member get(String email, String password) throws Exception;

  int update(Member member) throws Exception;

  List<Member> search(String keyword) throws Exception;
}
