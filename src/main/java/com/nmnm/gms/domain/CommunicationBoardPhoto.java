package com.nmnm.gms.domain;

public class CommunicationBoardPhoto {
  private int communicationPhotoNo; // PK
  private String photoFile;
  private int communicationBoardNo; // FK


  public int getCommunicationPhotoNo() {
    return communicationPhotoNo;
  }

  public void setCommunicationPhotoNo(int communicationPhotoNo) {
    this.communicationPhotoNo = communicationPhotoNo;
  }

  public String getPhotoFile() {
    return photoFile;
  }

  public void setPhotoFile(String photoFile) {
    this.photoFile = photoFile;
  }

  public int getCommunicationBoardNo() {
    return communicationBoardNo;
  }

  public void setCommunicationBoardNo(int communicationBoardNo) {
    this.communicationBoardNo = communicationBoardNo;
  }


}
