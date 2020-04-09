package com.nmnm.dto;

import java.sql.Date;

public class Member {

  private int no; // pk, auto
  private String name;
  private String photo;
  private Date birthday;
  private Boolean gender;
  private String email;
  private String tel;
  private String password;
  private String intro;
  private int interest;
  private String nickname;
  private int status;
  private int withdraw;
  private String sns;



  @Override
  public String toString() {
    return "Member [no=" + no + ", name=" + name + ", photo=" + photo + ", birthday=" + birthday
        + ", gender=" + gender + ", email=" + email + ", tel=" + tel + ", password=" + password
        + ", intro=" + intro + ", interest=" + interest + ", nickname=" + nickname + ", status="
        + status + ", withdraw=" + withdraw + ", sns=" + sns + "]";
  }



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



  public String getPhoto() {
    return photo;
  }



  public void setPhoto(String photo) {
    this.photo = photo;
  }



  public Date getBirthday() {
    return birthday;
  }



  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }



  public Boolean getGender() {
    return gender;
  }



  public void setGender(Boolean gender) {
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



  public String getNickname() {
    return nickname;
  }



  public void setNickname(String nickname) {
    this.nickname = nickname;
  }



  public int getStatus() {
    return status;
  }



  public void setStatus(int status) {
    this.status = status;
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
