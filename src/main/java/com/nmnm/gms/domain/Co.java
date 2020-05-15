package com.nmnm.gms.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Co {
  private int coNo; // PK
  private String category;
  private int memberNo; // FK
  private String title;
  private String content;
  private String createDate; // now()
  private int viewCount;



  public String getCreateDate() {
    Date cDate = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String createDate = sdf.format(cDate);
    return createDate;
  }


  public void setCreateDate(String createDate) {

    this.createDate = createDate;
  }


  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public int getViewCount() {
    return viewCount;
  }

  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }

  public int getCoNo() {
    return coNo;
  }

  public void setCoNo(int communicationBoardNo) {
    this.coNo = communicationBoardNo;
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



}
