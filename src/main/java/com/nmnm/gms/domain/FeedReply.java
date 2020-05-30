package com.nmnm.gms.domain;

import java.io.Serializable;
import java.sql.Date;

public class FeedReply implements Serializable{

  private static final long serialVersionUID = 1L;
  
  
  private int feedReplyNo; // nm_feed_reply PK NN auto_increment default=1
  private String content; // TEXT NN
  private int feedNo; // nm_feed PK/ FK NN
  private int memberNo; // nm_menber PK/ FK N
  private Date createDate; // now()
  
   
  
  public FeedReply() {
  }


  public FeedReply(int feedReplyNo, String content, int feedNo, int memberNo, Date createDate) {
    super();
    this.feedReplyNo = feedReplyNo;
    this.content = content;
    this.feedNo = feedNo;
    this.memberNo = memberNo;
    this.createDate = createDate;
  }



  @Override
  public String toString() {
    return "FeedReply [feedReplyNo=" + feedReplyNo + ", content=" + content + ", feedNo=" + feedNo
        + ", memberNo=" + memberNo + ", createDate=" + createDate + "]";
  }



  public int getFeedReplyNo() {
    return feedReplyNo;
  }



  public void setFeedReplyNo(int feedReplyNo) {
    this.feedReplyNo = feedReplyNo;
  }



  public String getContent() {
    return content;
  }



  public void setContent(String content) {
    this.content = content;
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



  public Date getCreateDate() {
    return createDate;
  }



  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }



  
}