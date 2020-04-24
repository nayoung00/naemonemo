package com.nmnm.gms.domain;

import java.sql.Date;

public class Group {

  private int groupNo; // pk, auto
  private String name;
  private String info;
  private String category;
  private String photo;
  private String city;
  private int maxPeopleNo;
  private Date createDate;


  @Override
  public String toString() {
    return "Group [groupNo=" + groupNo + ", name=" + name + ", info=" + info + ", category="
        + category + ", photo=" + photo + ", city=" + city + ", maxPeopleNo=" + maxPeopleNo
        + ", createDate=" + createDate + "]";
  }

  public String getName() {
    return name;
  }

  public int getGroupNo() {
    return groupNo;
  }


  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }


  public void setName(String name) {
    this.name = name;
  }


  public String getInfo() {
    return info;
  }


  public void setInfo(String info) {
    this.info = info;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }



  public String getPhoto() {
    return photo;
  }


  public void setPhoto(String photo) {
    this.photo = photo;
  }


  public String getCity() {
    return city;
  }


  public void setCity(String city) {
    this.city = city;
  }


  public int getMaxPeopleNo() {
    return maxPeopleNo;
  }


  public void setMaxPeopleNo(int maxPeopleNo) {
    this.maxPeopleNo = maxPeopleNo;
  }
}


