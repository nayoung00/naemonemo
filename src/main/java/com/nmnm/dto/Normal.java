package com.nmnm.dto;

import java.sql.Date;

public class Normal {

  private int no;
  private String tilte;
  private String content;
  private int noticable;
  private Date date;


  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getTilte() {
    return tilte;
  }

  public void setTilte(String tilte) {
    this.tilte = tilte;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getNoticable() {
    return noticable;
  }

  public void setNoticable(int noticable) {
    this.noticable = noticable;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }



}
