package com.nmnm.gms.domain;

public class Alram {
  private int memberNo; // pk(fk from 회원)
  private int noticeBoardNo; // fk from 회원
  private int planNo; // fk from 일정
  private int feedNo; // fk from 피드게시글


  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getNoticeBoardNo() {
    return noticeBoardNo;
  }

  public void setNoticeBoardNo(int noticeBoardNo) {
    this.noticeBoardNo = noticeBoardNo;
  }

  public int getPlanNo() {
    return planNo;
  }

  public void setPlanNo(int planNo) {
    this.planNo = planNo;
  }

  public int getFeedNo() {
    return feedNo;
  }

  public void setFeedNo(int feedNo) {
    this.feedNo = feedNo;
  }
}