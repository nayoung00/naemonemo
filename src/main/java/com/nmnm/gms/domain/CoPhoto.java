package com.nmnm.gms.domain;

import java.io.Serializable;

public class CoPhoto implements Serializable{

  private static final long serialVersionUID = 1L;
  
  private int no; // nm_feed_photo PK auto_increment default=1 NN
  private String filepath; // VARCHAR(255) NN
  private int coNo; //

  public CoPhoto() {}

  public CoPhoto(String filepath, int coNo) {
    this.filepath = filepath;
    this.coNo = coNo;
  }

  public CoPhoto(String filepath) {
    this.filepath = filepath;
  }
  
  public CoPhoto(int no, String filepath, int coNo) {
    this(filepath, coNo);
    this.no = no;
  }

  @Override
  public String toString() {
    return "FeedPhoto [no=" + no + ", filepath=" + filepath + ", coNo=" + coNo + "]";
  }

  
  public int getNo() {
    return no;
  }

  public CoPhoto setNo(int no) {
    this.no = no;
    return this;
  }

  public String getFilepath() {
    return filepath;
  }

  public CoPhoto setFilepath(String filepath) {
    this.filepath = filepath;
    return this;
  }

  public int getCoNo() {
    return coNo;
  }

  public CoPhoto setCoNo(int coNo) {
    this.coNo = coNo;
    return this;
  }

    
  
  
  
  
}