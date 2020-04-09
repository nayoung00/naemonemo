package com.nmnm.dto;

import java.sql.Date;

public class Plan {

  int planBoardNo; // nm_plan PK auto_increment default=1 NN
  int groupNo; // nm_group PK/ FK N
  Date planDate; // DATE NN
  String title; // VARCHAR(255) NN
  String placeName; // VARCHAR(255) N
  String address; // VARCHAR(255) NN
  int latitude; // 위도 N
  int longitude; // 경도 N

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
    this.groupNo = groupNo;
  }

  public Date getPlanDate() {
    return planDate;
  }

  public void setPlanDate(Date planDate) {
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
