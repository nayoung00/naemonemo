package com.nmnm.gms.domain;

import java.sql.Date;

public class Notice {

  private int noticeBoardNo; // PK_nm_notice_board, auto
  private int groupNo; // FK_nm_group
  private int memberNo; // FK_nm_meeting_member
  private String title;
  private String content;
  private Date createDate; // now()
 
  
  @Override
  public String toString() {
    return "Notice [noticeBoardNo=" + noticeBoardNo + ", groupNo=" + groupNo + ", memberNo="
        + memberNo + ", title=" + title + ", content=" + content + ", createDate=" + createDate
        + "]";
  }


  public int getNoticeBoardNo() {
    return noticeBoardNo;
  }


  public void setNoticeBoardNo(int noticeBoardNo) {
    this.noticeBoardNo = noticeBoardNo;
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

  
  
}
