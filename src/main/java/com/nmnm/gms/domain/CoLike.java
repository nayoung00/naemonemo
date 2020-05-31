package com.nmnm.gms.domain;

import java.io.Serializable;

public class CoLike implements Serializable{
  
  private static final long serialVersionUID = 1L;
  
  private int likeCount;
  private int coNo;
  private int memberNo;
  private int likeCheck;
  
  
  public int getLikeCount() {
    return likeCount;
  }
  public void setLikeCount(int likeCount) {
    this.likeCount = likeCount;
  }
  public int getCoNo() {
    return coNo;
  }
  public void setCoNo(int coNo) {
    this.coNo = coNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getLikeCheck() {
    return likeCheck;
  }
  public void setLikeCheck(int likeCheck) {
    this.likeCheck = likeCheck;
  }


 



}
