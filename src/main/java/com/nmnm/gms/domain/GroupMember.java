package com.nmnm.gms.domain;

public class GroupMember {

  private int groupNo; // pk, fk일정참여자,피드, 공지사항
  private int memberNo; // pk, fk일정참여자, 피드, 공지사항
  private int gradeNo; // fk등급


  @Override
  public String toString() {
    return "GroupMember [groupNo=" + groupNo + ", memberNo=" + memberNo + ", gradeNo=" + gradeNo
        + "]";
  }


  public int getGroupNo() {
    return groupNo;
  }


  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }


  public int getMemberNo() {
    return memberNo;
  }


  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }


  public int getGradeNo() {
    return gradeNo;
  }


  public void setGradeNo(int gradeNo) {
    this.gradeNo = gradeNo;
  }



}