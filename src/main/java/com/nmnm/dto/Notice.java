package com.nmnm.dto;

import java.sql.Date;
import java.util.List;

public class Notice {

  private int no;
  private int groupNo;
  private int MemberNo;
  
  private String title;
  private String content;
  private Date createDate;
  List<PhotoFile> files;


}
