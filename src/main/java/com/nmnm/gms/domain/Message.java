package com.nmnm.gms.domain;

import java.sql.Date;

public class Message {
  private int messageNo; // pk, 자동증가
  private int sender; // fk from 회원
  private int receiver; // fk from 회원
  private String title;
  private String content;
  private Date createdDate; // default now()
  private Date readDate; // default now()


  public int getMessageNo() {
    return messageNo;
  }

  public void setMessageNo(int messageNo) {
    this.messageNo = messageNo;
  }

  public int getSender() {
    return sender;
  }

  public void setSender(int sender) {
    this.sender = sender;
  }

  public int getReceiver() {
    return receiver;
  }

  public void setReceiver(int receiver) {
    this.receiver = receiver;
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

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public Date getReadDate() {
    return readDate;
  }

  public void setReadDate(Date readDate) {
    this.readDate = readDate;
  }



}