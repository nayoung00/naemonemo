package com.nmnm.gms.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Feed implements Serializable{

  private static final long serialVersionUID = 1L;
  
  private int feedNo; // nm_feed PK NN auto_increment default=1
  private int memberNo; // FK N
  private int groupNo; //  FK N
  private String title; // VARCHAR(255) NN
  private String content; // text NN
  private Date createDate; // DATETIME default=now() NN
  private int viewCount; // 0
  private List<FeedPhoto> feedPhotos;
  private String nickname; // 글쓸때 값 불러오는 용도
  
  @Override
  public String toString() {
    return "Feed [feedNo=" + feedNo + ", memberNo=" + memberNo + ", groupNo=" + groupNo + ", title="
        + title + ", content=" + content + ", createDate=" + createDate + ", viewCount=" + viewCount
        + ", feedPhotos=" + feedPhotos + ", nickname=" + nickname + "]";
  }
  public int getFeedNo() {
    return feedNo;
  }
  public void setFeedNo(int feedNo) {
    this.feedNo = feedNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public int getGroupNo() {
    return groupNo;
  }
  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
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
  public Date getCreateDate() {
    return createDate;
  }
  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }
  public int getViewCount() {
    return viewCount;
  }
  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  public List<FeedPhoto> getFeedPhotos() {
    return feedPhotos;
  }
  public void setFeedPhotos(List<FeedPhoto> feedPhotos) {
    this.feedPhotos = feedPhotos;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public Feed(int feedNo, int memberNo, int groupNo, String title, String content, Date createDate,
      int viewCount, List<FeedPhoto> feedPhotos, String nickname) {
    super();
    this.feedNo = feedNo;
    this.memberNo = memberNo;
    this.groupNo = groupNo;
    this.title = title;
    this.content = content;
    this.createDate = createDate;
    this.viewCount = viewCount;
    this.feedPhotos = feedPhotos;
    this.nickname = nickname;
  }
  
  public Feed() {}

}
