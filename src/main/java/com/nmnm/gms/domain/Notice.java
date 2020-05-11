package com.nmnm.gms.domain;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable{

  
  static final long serialVersionUID = 1L;
  
  int noticeNo; // PK_nm_notice, auto 
  int groupNo; // FK_nm_group
  int memberNo; // FK_nm_group_member
  String title; //
  String content; //
  Date createDate; // now()
  int viewCount;
  

  public int getNoticeNo() {
    return noticeNo;
  }
  public void setNoticeNo(int noticeNo) {
    this.noticeNo = noticeNo;
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
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public Date getCreateDate() {
    return createDate;
  }
  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }
  public int getViewCount() {
    return viewCount;
  }
  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  
  
  
  
  
  
}
