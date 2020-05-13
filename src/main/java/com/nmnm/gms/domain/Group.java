package com.nmnm.gms.domain;

import java.sql.Date;

public class Group {

  public int groupNo; // pk, auto 모임 번호
  private String groupName; // 모임 이름
  private String groupInfo; // 모임 설명
  private String groupForm; // 모임 형태 (온라인 or 오프라인)
  private String groupInterest; // 모임 관심사 (춤, 노래, 음식 ....)
  private String groupPhoto; // 모임 썸네일
  private String city; // 모임 지역
  private String gradeName; // 등급 명칭
  private int maxPeopleNo; // 모임 최대인원
  private Date createDate; // 모임 생성일

  @Override
  public String toString() {
    return "Group [groupNo=" + groupNo + ", groupName=" + groupName + ", groupInfo=" + groupInfo
        + ", groupForm=" + groupForm + ", groupInterest=" + groupInterest + ", groupPhoto="
        + groupPhoto + ", city=" + city + ", gradeName=" + gradeName + ", maxPeopleNo="
        + maxPeopleNo + ", createDate=" + createDate + "]";
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public String getGroupName() {
    return groupName;
  }

  public void setGroupName(String groupName) {
    this.groupName = groupName;
  }

  public String getGroupInfo() {
    return groupInfo;
  }

  public void setGroupInfo(String groupInfo) {
    this.groupInfo = groupInfo;
  }

  public String getGroupForm() {
    return groupForm;
  }

  public void setGroupForm(String groupForm) {
    this.groupForm = groupForm;
  }

  public String getGroupInterest() {
    return groupInterest;
  }

  public void setGroupInterest(String groupInterest) {
    this.groupInterest = groupInterest;
  }

  public String getGroupPhoto() {
    return groupPhoto;
  }

  public void setGroupPhoto(String groupPhoto) {
    this.groupPhoto = groupPhoto;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getGradeName() {
    return gradeName;
  }

  public void setGradeName(String gradeName) {
    this.gradeName = gradeName;
  }

  public int getMaxPeopleNo() {
    return maxPeopleNo;
  }

  public void setMaxPeopleNo(int maxPeopleNo) {
    this.maxPeopleNo = maxPeopleNo;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }


}
