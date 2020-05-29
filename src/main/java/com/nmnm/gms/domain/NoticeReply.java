package com.nmnm.gms.domain;

import java.io.Serializable;

public class NoticeReply implements Serializable {

  private static final long serialVersionUID = 1L;
  
  private int noticeReplyNo; // PK_nm_notice_reply, auto
  private String content; //
  private int noticeNo; // FK_nm_notice
  private int memberNo; // FK_nm_member
  Notice notice;
  
  @Override
  public String toString() {
    return "NoticeReply [noticeReplyNo=" + noticeReplyNo + ", content=" + content + ", noticeNo="
        + noticeNo + ", memberNo=" + memberNo + ", notice=" + notice + "]";
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

  public Notice getNotice() {
    return notice;
  }

  public void setNotice(Notice notice) {
    this.notice = notice;
  }
  
  
  
  
  
}
