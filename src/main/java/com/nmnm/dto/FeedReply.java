package com.nmnm.dto;

public class FeedReply {
  int feedReplyNo; // nm_feed_reply PK NN auto_increment default=1
  String content; // TEXT NN
  int feedNo; // nm_feed PK/ FK NN
  int memberNo; // nm_nenber PK/ FK N

  @Override
  public String toString() {
    return "FeedReply [feedReplyNo=" + feedReplyNo + ", content=" + content + ", feedNo=" + feedNo
        + ", memberNo=" + memberNo + "]";
  }

  public int getFeedReplyNo() {
    return feedReplyNo;
  }

  public void setFeedReplyNo(int feedReplyNo) {
    this.feedReplyNo = feedReplyNo;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
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

}
