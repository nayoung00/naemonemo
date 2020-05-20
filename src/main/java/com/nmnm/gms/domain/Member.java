package com.nmnm.gms.domain;

import java.sql.Date;
import java.util.List;

public class Member {

  private int no; // pk, auto
  private String name;
  private String photo;
  private Date birthday;
  private String email;
  private String password;
  private String intro;
  private String interest;
  private String nickname;
  private String address;
  private int accountStatus;
  private int withdraw;
  private Date createDate;
  private List<Message> message;
  private String userkey;
  private Group group;

  public Group getGroup() {
    return group;
  }

  public void setGroup(Group group) {
    this.group = group;
  }

  public String getUserKey() {
    return userkey;
  }

  public void setUserKey(String userkey) {
    this.userkey = userkey;
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

  public int getAccountStatus() {
    return accountStatus;
  }

  public void setAccountStatus(int accountStatus) {
    this.accountStatus = accountStatus;
  }

  public int getWithdraw() {
    return withdraw;
  }

  public void setWithdraw(int withdraw) {
    this.withdraw = withdraw;
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

  @Override
  public String toString() {
    return "Member [no=" + no + ", name=" + name + ", photo=" + photo + ", birthday=" + birthday
        + ", email=" + email + ", password=" + password + ", intro=" + intro + ", interest="
        + interest + ", nickname=" + nickname + ", address=" + address + ", accountStatus="
        + accountStatus + ", withdraw=" + withdraw + ", createDate=" + createDate + ", message="
        + message + ", userkey=" + userkey + ", group=" + group + "]";
  }


}
