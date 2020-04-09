package com.nmnm.dto;

public class FeedPhoto {

  private int feedPhotoNo; // nm_feed_photo PK auto_increment default=1 NN
  private String photoFile; // VARCHAR(255) NN
  private int feedNo; // nm_feed PK/ FK NS

  @Override
  public String toString() {
    return "FeedPhoto [feedPhotoNo=" + feedPhotoNo + ", photoFile=" + photoFile + ", feedNo="
        + feedNo + "]";
  }

  public int getFeedPhotoNo() {
    return feedPhotoNo;
  }

  public void setFeedPhotoNo(int feedPhotoNo) {
    this.feedPhotoNo = feedPhotoNo;
  }

  public String getPhotoFile() {
    return photoFile;
  }

  public void setPhotoFile(String photoFile) {
    this.photoFile = photoFile;
  }

  public int getFeedNo() {
    return feedNo;
  }

  public void setFeedNo(int feedNo) {
    this.feedNo = feedNo;
  }
}
