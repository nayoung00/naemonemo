package com.nmnm.gms.domain;

import java.io.Serializable;

public class FeedPhoto implements Serializable{

  private static final long serialVersionUID = 1L;
  
  private int no; // nm_feed_photo PK auto_increment default=1 NN
  private String filepath; // VARCHAR(255) NN
  private int feedNo; //

  public FeedPhoto() {}

  public FeedPhoto(String filepath, int feedNo) {
    this.filepath = filepath;
    this.feedNo = feedNo;
  }

  public FeedPhoto(String filepath) {
    this.filepath = filepath;
  }
  
  public FeedPhoto(int no, String filepath, int feedNo) {
    this(filepath, feedNo);
    this.no = no;
  }

  @Override
  public String toString() {
    return "FeedPhoto [no=" + no + ", filepath=" + filepath + ", feedNo=" + feedNo + "]";
  }

  
  public int getNo() {
    return no;
  }

  public FeedPhoto setNo(int no) {
    this.no = no;
    return this;
  }

  public String getFilepath() {
    return filepath;
  }

  public FeedPhoto setFilepath(String filepath) {
    this.filepath = filepath;
    return this;
  }

  public int getFeedNo() {
    return feedNo;
  }

  public FeedPhoto setFeedNo(int feedNo) {
    this.feedNo = feedNo;
    return this;
  }

    
  
  
  
  
}