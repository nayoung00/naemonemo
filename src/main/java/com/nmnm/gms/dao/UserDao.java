package com.nmnm.gms.dao;

import java.sql.SQLException;
import org.apache.ibatis.annotations.Param;
import com.nmnm.gms.domain.Member;

public interface UserDao {

  /* 유저정보관련 */
  int regUser(Member member) throws SQLException;// 유저 회원가입 메서드

  int GetKey(String email, String userKey); // 유저 인증키 생성 메서드

  int alterUserKey(String email, String key); // 유저 인증키 Y로 바꿔주는 메서드

  int searchPassword(String email, String name, String key); // 회원 임시 비밀번호 변경 메서드

  Member loginUser(@Param("email") String email);// 유저 로그인 메서드

}
