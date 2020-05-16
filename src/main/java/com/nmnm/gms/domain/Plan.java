package com.nmnm.gms.domain;

import java.sql.Date;

public class Plan {

  private int planNo; // nm_plan PK auto_increment default=1 NN
  private int groupNo; // nm_group PK/ FK N
  private Date planDate; // DATE NN
  private String title; // VARCHAR(255) NN
  private String subtitle;
  private String thumbnail;
  private String content;
  private String placeName; // VARCHAR(255) N
  private String address; // VARCHAR(255) NN
  private int latitude; // 위도 N
  private int longitude; // 경도 N
  private String createDate;
  
  @Override
  public String toString() {
    return "Plan [planNo=" + planNo + ", groupNo=" + groupNo + ", planDate=" + planDate + ", title="
        + title + ", subtitle=" + subtitle + ", thumbnail=" + thumbnail + ", content=" + content
        + ", placeName=" + placeName + ", address=" + address + ", latitude=" + latitude
        + ", longitude=" + longitude + ", createDate=" + createDate + "]";
  }

  public int getPlanNo() {
    return planNo;
  }

  public void setPlanNo(int planNo) {
    this.planNo = planNo;
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

  public String getSubtitle() {
    return subtitle;
  }

  public void setSubtitle(String subtitle) {
    this.subtitle = subtitle;
  }

  public String getThumbnail() {
    return thumbnail;
  }

  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
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

  public String getCreateDate() {
    return createDate;
  }

  public void setCreateDate(String createDate) {
    this.createDate = createDate;
  }



}
