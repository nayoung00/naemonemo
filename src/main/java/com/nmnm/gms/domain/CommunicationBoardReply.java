package com.nmnm.gms.domain;

public class CommunicationBoardReply {
  private int communicationReplyNo; // PK
  private String content;
  private int communicationBoardNo; // FK
  private int memberNo; // FK


  public int getCommunicationReplyNo() {
    return communicationReplyNo;
  }

  public void setCommunicationReplyNo(int communicationReplyNo) {
    this.communicationReplyNo = communicationReplyNo;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

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

}
