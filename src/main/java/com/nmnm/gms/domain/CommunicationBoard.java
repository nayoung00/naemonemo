package com.nmnm.gms.domain;

import java.util.Date;

public class CommunicationBoard {
  private int communicationBoardNo; // PK
  private int memberNo; // FK
  private String title;
  private String content;
  private int noticeable;
  private Date createDate;

  public int getCommunicationBoardNo() {
    return communicationBoardNo;
  }

  public void setCommunicationBoardNo(int communicationBoardNo) {
    this.communicationBoardNo = communicationBoardNo;
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

  public int getNoticeable() {
    return noticeable;
  }

  public void setNoticeable(int noticeable) {
    this.noticeable = noticeable;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }


}
