package com.nmnm.dto;

import java.sql.Date;

public class Feed {

  private int no;
  private int typeNo;
  private int groupNo;
  private int MemberNo;
  private String content;
  private Date reateDate;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public int getTypeNo() {
    return typeNo;
  }

  public void setTypeNo(int typeNo) {
    this.typeNo = typeNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public int getMemberNo() {
    return MemberNo;
  }

  public void setMemberNo(int memberNo) {
    MemberNo = memberNo;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Date getReateDate() {
    return reateDate;
  }

  public void setReateDate(Date reateDate) {
    this.reateDate = reateDate;
  }



}
