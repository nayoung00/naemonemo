package com.nmnm.gms.domain;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {

  private static final long serialVersionUID = 1L;
  
  private int noticeNo; // PK_nm_notice, auto 
  private int groupNo; // FK_nm_group?
  private int memberNo; // FK_nm_group_member?
  private String title; //
  private String content; //
  private Date createDate; // now()
  private int viewCount;
  private String nickname;
  
  public Notice() {}


  
  public Notice(int noticeNo, int groupNo, int memberNo, String title, String content,
      Date createDate, int viewCount, String nickname) {
    super();
    this.noticeNo = noticeNo;
    this.groupNo = groupNo;
    this.memberNo = memberNo;
    this.title = title;
    this.content = content;
    this.createDate = createDate;
    this.viewCount = viewCount;
    this.nickname = nickname;
  }



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



  public String getNickname() {
    return nickname;
  }



  public void setNickname(String nickname) {
    this.nickname = nickname;
  }



  @Override
  public String toString() {
    return "Notice [noticeNo=" + noticeNo + ", groupNo=" + groupNo + ", memberNo=" + memberNo
        + ", title=" + title + ", content=" + content + ", createDate=" + createDate
        + ", viewCount=" + viewCount + ", nickname=" + nickname + "]";
  }



  
  
}
