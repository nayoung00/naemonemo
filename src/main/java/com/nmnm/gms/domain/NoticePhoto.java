package com.nmnm.gms.domain;

import java.io.Serializable;

public class NoticePhoto implements Serializable{

  private static final long serialVersionUID = 1L;
  
  private int no; // PK_nm_notice_photo_no, auto
  private String filepath; //
  private int noticeNo; // FK_nm_notice
  
  
  public NoticePhoto() {
  }

  public NoticePhoto(String filepath, int noticeNo) {
    this.filepath = filepath;
    this.noticeNo = noticeNo;
  }

  public NoticePhoto(String filepath) {
    this.filepath = filepath;
  }

  public NoticePhoto(int no, String filepath, int noticeNo) {
    this(filepath, noticeNo);
    this.no = no;
  }

  @Override
  public String toString() {
    return "NoticePhoto [no=" + no + ", filepath=" + filepath + ", noticeNo=" + noticeNo + "]";
  }

  public int getNo() {
    return no;
  }

  public NoticePhoto setNo(int no) {
    this.no = no;
    return this;
  }

  public String getFilepath() {
    return filepath;
  }

  public NoticePhoto setFilepath(String filepath) {
    this.filepath = filepath;
    return this;
  }

  public int getNoticeNo() {
    return noticeNo;
  }

  public NoticePhoto setNoticeNo(int noticeNo) {
    this.noticeNo = noticeNo;
    return this;
  }
  
  
  
  
  
}

