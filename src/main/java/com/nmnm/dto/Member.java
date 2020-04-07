package com.nmnm.dto;

import java.sql.Date;

public class Member {

  private int no;
  private String name;
  private String idPhoto;
  private Date birthday;
  private boolean gender;
  private String email;
  private String tel;
  private String password;
  private String intro;
  private int interest;
  private String nickName;
  private int accountStatus; // 회원 여부
  private int gradeNo; // 등급 번호 등급 FK
  private int withdraw;
  private String sns;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getIdPhoto() {
    return idPhoto;
  }

  public void setIdPhoto(String idPhoto) {
    this.idPhoto = idPhoto;
  }

  public Date getBirthday() {
    return birthday;
  }

  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }

  public boolean isGender() {
    return gender;
  }

  public void setGender(boolean gender) {
    this.gender = gender;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getIntro() {
    return intro;
  }

  public void setIntro(String intro) {
    this.intro = intro;
  }

  public int getInterest() {
    return interest;
  }

  public void setInterest(int interest) {
    this.interest = interest;
  }

  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  public int getAccountStatus() {
    return accountStatus;
  }

  public void setAccountStatus(int accountStatus) {
    this.accountStatus = accountStatus;
  }

  public int getGradeNo() {
    return gradeNo;
  }

  public void setGradeNo(int gradeNo) {
    this.gradeNo = gradeNo;
  }

  public int getWithdraw() {
    return withdraw;
  }

  public void setWithdraw(int withdraw) {
    this.withdraw = withdraw;
  }

  public String getSns() {
    return sns;
  }

  public void setSns(String sns) {
    this.sns = sns;
  }

}
