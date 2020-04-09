package com.nmnm.dto;

import java.sql.Date;

public class Feed {

  private int feedNo; // nm_feed PK NN auto_increment default=1
  private int memberNo; // nm_meeting_member PK/ FK N
  private int groupNo; // nm_meeting_member PK/ FK N
  private String title; // VARCHAR(255) NN
  private String content; // text NN
  private Date createDate; // DATETIME default=now() NN

  @Override
  public String toString() {
    return "Feed [feedNo=" + feedNo + ", memberNo=" + memberNo + ", groupNo=" + groupNo + ", title="
        + title + ", content=" + content + ", createDate=" + createDate + "]";
  }

  public int getFeedNo() {
    return feedNo;
  }

  public void setFeedNo(int feedNo) {
    this.feedNo = feedNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
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
}
