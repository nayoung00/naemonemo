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
  private Date createDate;
  private List<Message> message;
  private Group group;
  private String userkey;
  private int authStatus;

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

  public String getUserkey() {
    return userkey;
  }

  public void setUserkey(String userkey) {
    this.userkey = userkey;
  }

  public Group getGroup() {
    return group;
  }

  public void setGroup(Group group) {
    this.group = group;
  }

  public int getAuthStatus() {
    return authStatus;
  }

  public void setAuthStatus(int authStatus) {
    this.authStatus = authStatus;
  }



  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((address == null) ? 0 : address.hashCode());
    result = prime * result + authStatus;
    result = prime * result + ((birthday == null) ? 0 : birthday.hashCode());
    result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + ((group == null) ? 0 : group.hashCode());
    result = prime * result + ((interest == null) ? 0 : interest.hashCode());
    result = prime * result + ((intro == null) ? 0 : intro.hashCode());
    result = prime * result + ((message == null) ? 0 : message.hashCode());
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
    result = prime * result + no;
    result = prime * result + ((password == null) ? 0 : password.hashCode());
    result = prime * result + ((photo == null) ? 0 : photo.hashCode());
    result = prime * result + ((userkey == null) ? 0 : userkey.hashCode());
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
    if (address == null) {
      if (other.address != null)
        return false;
    } else if (!address.equals(other.address))
      return false;
    if (authStatus != other.authStatus)
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
    if (group == null) {
      if (other.group != null)
        return false;
    } else if (!group.equals(other.group))
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
    if (userkey == null) {
      if (other.userkey != null)
        return false;
    } else if (!userkey.equals(other.userkey))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "Member [no=" + no + ", name=" + name + ", photo=" + photo + ", birthday=" + birthday
        + ", email=" + email + ", password=" + password + ", intro=" + intro + ", interest="
        + interest + ", nickname=" + nickname + ", address=" + address + ", createDate="
        + createDate + ", message=" + message + ", userkey=" + userkey + ", group=" + group
        + ", authStatus=" + authStatus + "]";
  }


}
