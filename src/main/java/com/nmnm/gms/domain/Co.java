package com.nmnm.gms.domain;

import java.io.Serializable;
import java.util.List;

public class Co implements Serializable{
  
  private static final long serialVersionUID = 1L;
  
  private int coNo; // PK
  private String category;
  private int memberNo; // FK
  private String title;
  private String content;
  private String createDate; // now()
  private String nickname; 
  private int viewCount;
  private List<CoPhoto> coPhotos;





  @Override
	public String toString() {
		return "Co [coNo=" + coNo + ", category=" + category + ", memberNo=" + memberNo + ", title=" + title + ", content="
				+ content + ", createDate=" + createDate + ", nickname=" + nickname + ", viewCount=" + viewCount + ", coPhotos="
				+ coPhotos + "]";
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getCreateDate() {
    // Date currentDate = new Date();
    // SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    // String createDate = format.format(currentDate);
    return createDate;
  }



  public void setCreateDate(String createDate) {
    this.createDate = createDate;
  }



  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public int getViewCount() {
    return viewCount;
  }

  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }

  public int getCoNo() {
    return coNo;
  }

  public void setCoNo(int communicationBoardNo) {
    this.coNo = communicationBoardNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
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

  public List<CoPhoto> getCoPhotos() {
    return coPhotos;
  }

  public void setCoPhotos(List<CoPhoto> coPhotos) {
    this.coPhotos = coPhotos;
  }


}
