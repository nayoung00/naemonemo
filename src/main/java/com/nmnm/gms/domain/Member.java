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
  private String sns;
  private Date createDate;
  private List<Message> message;
  private String alterKey;

  public String getAlterKey() {
    return alterKey;
  }

  public void setAlterKey(String alterKey) {
    this.alterKey = alterKey;
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

  public String getSns() {
    return sns;
  }

  public void setSns(String sns) {
    this.sns = sns;
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
        + accountStatus + ", withdraw=" + withdraw + ", sns=" + sns + ", createDate=" + createDate
        + ", message=" + message + ", alterKey=" + alterKey + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + accountStatus;
    result = prime * result + ((address == null) ? 0 : address.hashCode());
    result = prime * result + ((alterKey == null) ? 0 : alterKey.hashCode());
    result = prime * result + ((birthday == null) ? 0 : birthday.hashCode());
    result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + ((interest == null) ? 0 : interest.hashCode());
    result = prime * result + ((intro == null) ? 0 : intro.hashCode());
    result = prime * result + ((message == null) ? 0 : message.hashCode());
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
    result = prime * result + no;
    result = prime * result + ((password == null) ? 0 : password.hashCode());
    result = prime * result + ((photo == null) ? 0 : photo.hashCode());
    result = prime * result + ((sns == null) ? 0 : sns.hashCode());
    result = prime * result + withdraw;
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    Member other = (Member) obj;
    if (accountStatus != other.accountStatus)
      return false;
    if (address == null) {
      if (other.address != null)
        return false;
    } else if (!address.equals(other.address))
      return false;
    if (alterKey == null) {
      if (other.alterKey != null)
        return false;
    } else if (!alterKey.equals(other.alterKey))
      return false;
    if (birthday == null) {
      if (other.birthday != null)
        return false;
    } else if (!birthday.equals(other.birthday))
      return false;
    if (createDate == null) {
      if (other.createDate != null)
        return false;
    } else if (!createDate.equals(other.createDate))
      return false;
    if (email == null) {
      if (other.email != null)
        return false;
    } else if (!email.equals(other.email))
      return false;
    if (interest == null) {
      if (other.interest != null)
        return false;
    } else if (!interest.equals(other.interest))
      return false;
    if (intro == null) {
      if (other.intro != null)
        return false;
    } else if (!intro.equals(other.intro))
      return false;
    if (message == null) {
      if (other.message != null)
        return false;
    } else if (!message.equals(other.message))
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (nickname == null) {
      if (other.nickname != null)
        return false;
    } else if (!nickname.equals(other.nickname))
      return false;
    if (no != other.no)
      return false;
    if (password == null) {
      if (other.password != null)
        return false;
    } else if (!password.equals(other.password))
      return false;
    if (photo == null) {
      if (other.photo != null)
        return false;
    } else if (!photo.equals(other.photo))
      return false;
    if (sns == null) {
      if (other.sns != null)
        return false;
    } else if (!sns.equals(other.sns))
      return false;
    if (withdraw != other.withdraw)
      return false;
    return true;
  }



}
