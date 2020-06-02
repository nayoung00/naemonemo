package com.nmnm.gms.domain;

import java.sql.Date;

public class Plan {

  private int planNo; // nm_plan PK auto_increment default=1 NN
  private int groupNo; // nm_group PK/ FK N
  private int memberNo;
  private String memberName;
  private String startDate; // DATE NN
  private String endDate; // DATE NN
  private String startHour; // 시간 저장
  private String endHour; // 시간 저장
  private String title; // VARCHAR(255) NN
  private String thumbnail;
  private String content;
  private String category;
  private String address; // VARCHAR(255) NN
  private int latitude; // 위도 N
  private int longitude; // 경도 N
  private Date createDate;
  private String backgroundColor;
  private boolean allday = false;


  @Override
  public String toString() {
    return "Plan [planNo=" + planNo + ", groupNo=" + groupNo + ", memberNo=" + memberNo
        + ", memberName=" + memberName + ", startDate=" + startDate + ", endDate=" + endDate
        + ", startHour=" + startHour + ", endHour=" + endHour + ", title=" + title + ", thumbnail="
        + thumbnail + ", content=" + content + ", category=" + category + ", address=" + address
        + ", latitude=" + latitude + ", longitude=" + longitude + ", createDate=" + createDate
        + ", backgroundColor=" + backgroundColor + ", allday=" + allday + "]";
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
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public String getMemberName() {
    return memberName;
  }
  public void setMemberName(String memberName) {
    this.memberName = memberName;
  }
  public String getStartDate() {
    return startDate;
  }
  public void setStartDate(String startDate) {
    this.startDate = startDate;
  }
  public String getEndDate() {
    return endDate;
  }
  public void setEndDate(String endDate) {
    this.endDate = endDate;
  }
  public String getStartHour() {
    return startHour;
  }
  public void setStartHour(String startHour) {
    this.startHour = startHour;
  }
  public String getEndHour() {
    return endHour;
  }
  public void setEndHour(String endHour) {
    this.endHour = endHour;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
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
  public String getCategory() {
    return category;
  }
  public void setCategory(String category) {
    this.category = category;
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
  public Date getCreateDate() {
    return createDate;
  }
  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }
  public String getBackgroundColor() {
    return backgroundColor;
  }
  public void setBackgroundColor(String backgroundColor) {
    this.backgroundColor = backgroundColor;
  }
  public boolean isAllday() {
    return allday;
  }
  public void setAllday(boolean allday) {
    this.allday = allday;
  }


}
