package com.nmnm.dto;

public class CommunicationBoardLike {
  private int memberNo; // PK,FK
  private int communicationBoardNo; // PK,FK


  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getCommunicationBoardNo() {
    return communicationBoardNo;
  }

  public void setCommunicationBoardNo(int communicationBoardNo) {
    this.communicationBoardNo = communicationBoardNo;
  }



}
