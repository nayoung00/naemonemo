package com.nmnm.gms.domain;

import java.io.Serializable;
import java.sql.Date;

public class CoReply implements Serializable{

  private static final long serialVersionUID = 1L;
  
  
  private int coReplyNo; // nm_co_reply PK NN auto_increment default=1
  private String content; // TEXT NN
  private int coNo; // nm_co PK/ FK NN
  private int memberNo; // nm_menber PK/ FK N
  private Date createDate; // now()
  
   
  
  public CoReply() {
  }


  public CoReply(int coReplyNo, String content, int coNo, int memberNo, Date createDate) {
    super();
    this.coReplyNo = coReplyNo;
    this.content = content;
    this.coNo = coNo;
    this.memberNo = memberNo;
    this.createDate = createDate;
  }



  @Override
  public String toString() {
    return "FeedReply [coReplyNo=" + coReplyNo + ", content=" + content + ", coNo=" + coNo
        + ", memberNo=" + memberNo + ", createDate=" + createDate + "]";
  }


  public int getCoReplyNo() {
    return coReplyNo;
  }


  public void setCoReplyNo(int coReplyNo) {
    this.coReplyNo = coReplyNo;
  }


  public String getContent() {
    return content;
  }


  public void setContent(String content) {
    this.content = content;
  }


  public int getCoNo() {
    return coNo;
  }


  public void setCoNo(int coNo) {
    this.coNo = coNo;
  }


  public int getMemberNo() {
    return memberNo;
  }


  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }


  public Date getCreateDate() {
    return createDate;
  }


  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }



  
}