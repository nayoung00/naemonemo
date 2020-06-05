package com.nmnm.gms.domain;

import java.io.Serializable;
import java.sql.Date;

public class NoticeReply implements Serializable{

  private static final long serialVersionUID = 1L;
  
  private int noticeReplyNo; // nm_notice_reply PK NN auto_increment default=1
  private String content; // TEXT NN
  private int noticeNo; // nm_notice PK/ FK NN
  private int memberNo; // nm_menber PK/ FK N
  private Date createDate; // now()
  private String nickname;
  
  public NoticeReply() {
  }



  public NoticeReply(int noticeReplyNo, String content, int noticeNo, int memberNo, Date createDate,
      String nickname) {
    super();
    this.noticeReplyNo = noticeReplyNo;
    this.content = content;
    this.noticeNo = noticeNo;
    this.memberNo = memberNo;
    this.createDate = createDate;
    this.nickname = nickname;
  }





  
  @Override
  public String toString() {
    return "NoticeReply [noticeReplyNo=" + noticeReplyNo + ", content=" + content + ", noticeNo="
        + noticeNo + ", memberNo=" + memberNo + ", createDate=" + createDate + ", nickname="
        + nickname + "]";
  }



  public int getNoticeReplyNo() {
    return noticeReplyNo;
  }



  public void setNoticeReplyNo(int noticeReplyNo) {
    this.noticeReplyNo = noticeReplyNo;
  }



  public String getContent() {
    return content;
  }



  public void setContent(String content) {
    this.content = content;
  }



  public int getNoticeNo() {
    return noticeNo;
  }



  public void setNoticeNo(int noticeNo) {
    this.noticeNo = noticeNo;
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



  public String getNickname() {
    return nickname;
  }



  public void setNickname(String nickname) {
    this.nickname = nickname;
  }





  
}