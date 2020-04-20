package com.nmnm.dto;

import java.sql.Date;
import java.util.List;

public class Notice {

  private int noticeBoardNo; // PK_nm_notice_board, auto
  private int groupNo; // FK_nm_group
  private int memberNo; // FK_nm_meeting_member
  private String title;
  private String content;
  private Date createDate; // now()

}
