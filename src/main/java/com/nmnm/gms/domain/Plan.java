package com.nmnm.gms.domain;

import java.sql.Date;

public class Plan {

  private int planBoardNo; // nm_plan PK auto_increment default=1 NN
  private int groupNo; // nm_group PK/ FK N
  private Date planDate; // DATE NN
  private String title; // VARCHAR(255) NN
  private String placeName; // VARCHAR(255) N
  private String address; // VARCHAR(255) NN
  private int latitude; // 위도 N
  private int longitude; // 경도 N

  @Override
  public String toString() {
    return "Plan [planBoardNo=" + planBoardNo + ", groupNo=" + groupNo + ", planDate=" + planDate
        + ", title=" + title + ", placeName=" + placeName + ", address=" + address + ", latitude="
        + latitude + ", longitude=" + longitude + "]";
  }

  public int getPlanBoardNo() {
    return planBoardNo;
  }

  public void setPlanBoardNo(int planBoardNo) {
    this.planBoardNo = planBoardNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    System.out.println("groupNo setter()");
    this.groupNo = groupNo;
  }

  public Date getPlanDate() {
    System.out.println("planDate getter()");
    return planDate;
  }

  public void setPlanDate(Date planDate) {
    System.out.println("planDate setter()");
    this.planDate = planDate;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getPlaceName() {
    return placeName;
  }

  public void setPlaceName(String placeName) {
    this.placeName = placeName;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public int getLatitude() {
    return latitude;
  }

  public void setLatitude(int latitude) {
    this.latitude = latitude;
  }

  public int getLongitude() {
    return longitude;
  }

  public void setLongitude(int longitude) {
    this.longitude = longitude;
  }
}
