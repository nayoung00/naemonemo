package com.nmnm.gms.domain;

import java.sql.Date;
import java.util.List;

public class Member {

  private int memberNo; // pk, auto
  private String name;
  private String photo;
  private Date birthday;
  private String email;
  private String password;
  private String intro;
  private String interest;
  private String nickname;
  private String address;
  private Date createDate;
  private List<Message> message;
  private Group group;
  private String userkey;
  private String authStatus;

  @Override
  public String toString() {
    return "Member [memberNo=" + memberNo + ", name=" + name + ", photo=" + photo + ", birthday="
        + birthday + ", email=" + email + ", password=" + password + ", intro=" + intro
        + ", interest=" + interest + ", nickname=" + nickname + ", address=" + address
        + ", createDate=" + createDate + ", message=" + message + ", group=" + group + ", userkey="
        + userkey + ", authStatus=" + authStatus + "]";
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
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

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
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

  public String getInterest() {
    return interest;
  }

  public void setInterest(String interest) {
    this.interest = interest;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public List<Message> getMessage() {
    return message;
  }

  public void setMessage(List<Message> message) {
    this.message = message;
  }

  public Group getGroup() {
    return group;
  }

  public void setGroup(Group group) {
    this.group = group;
  }

  public String getUserkey() {
    return userkey;
  }

  public void setUserkey(String userkey) {
    this.userkey = userkey;
  }

  public String getAuthStatus() {
    return authStatus;
  }

  public void setAuthStatus(String authStatus) {
    this.authStatus = authStatus;
  }



}
