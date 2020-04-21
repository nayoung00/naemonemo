package com.nmnm.gms.domain;

public class NoticeReply {

  private int noticeReplyNo; // PK_nm_notice_reply, auto
  private String content; // 
  private int noticeBoardNo; // FK_nm_notice_board
  private int memberNo; // FK_nm_member
}
