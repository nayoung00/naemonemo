package com.nmnm.gms.domain;

public class AccountAuthority {

  private int accountAuthrityNo; // pk
  private int groupNo; // fk from 모임, 자동증가
  private int authorityNo; // fk from 사용권한
  private int gradeNo; // fk from 등급


  public int getAccountAuthrityNo() {
    return accountAuthrityNo;
  }

  public void setAccountAuthrityNo(int accountAuthrityNo) {
    this.accountAuthrityNo = accountAuthrityNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public int getAuthorityNo() {
    return authorityNo;
  }

  public void setAuthorityNo(int authorityNo) {
    this.authorityNo = authorityNo;
  }

  public int getGradeNo() {
    return gradeNo;
  }

  public void setGradeNo(int gradeNo) {
    this.gradeNo = gradeNo;
  }



}