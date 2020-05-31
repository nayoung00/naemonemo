package com.nmnm.gms.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public class CoLikeDao{
  
  private SqlSession session;
  private static CoLikeDao instance = new CoLikeDao();
  private CoLikeDao() {
  }

  public static CoLikeDao getInstance() {
      return instance;
  }

//myBatis
  private SqlSession getSession() {
      Reader reader = null;
      try {
          reader = Resources.getResourceAsReader("./SqlMapConfig.xml");
          SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
          session = sf.openSession(true);
      } catch (IOException e) {
          System.out.println("getSession 에러 : " + e);
          e.printStackTrace();
      }
      return session;
  }
  
  // 게시글 추천여부 검사
  public int recCheck(Map<String, Object> m) {
      int result = 0;
      try {
          session = getSession();
          result = (Integer) session.selectOne("CoLike.rec_check", m);
      } catch (Exception e) {
          System.out.println("recCheck : " + e);
          e.printStackTrace();
      }
      return result;
  }
  
  // 게시글 추천
  public void recUpdate(Map<String, Object> m){
      try {
          session = getSession();
          session.insert("CoLike.rec_update", m);
      } catch (Exception e) {
          System.out.println("recUpdate : " + e);
          e.printStackTrace();
      }
  }
  
  // 게시글 추천 제거
  public void recDelete(Map<String, Object> m){
      try {
          session = getSession();
          session.insert("CoLike.rec_delete", m);
      } catch (Exception e) {
          System.out.println("recDelete : " + e);
          e.printStackTrace();
      }
  }
  
  // 게시글 추천수
  public int recCount(int no){
      int count = 0;
      try {
          session = getSession();
          count = (Integer) session.selectOne("CoLike.rec_count", no);
      } catch (Exception e) {
          System.out.println("recCount : " + e);
          e.printStackTrace();
      }
      return count;
  }
}
