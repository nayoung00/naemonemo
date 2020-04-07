package com.nmnm.domain;

import java.io.Serializable;

// 사진 게시글의 사진 첨부 파일 데이터를 저장하는 클래스
public class GroupPhotoFile implements Serializable {
  private static final long serialVersionUID = 1L;

  int no;
  String filepath;
  int groupNo;

  public GroupPhotoFile() {}

  public GroupPhotoFile(String filepath, int groupNo) {
    this.filepath = filepath;
    this.groupNo = groupNo;
  }

  public GroupPhotoFile(int no, String filepath, int groupNo) {
    this(filepath, groupNo);
    this.no = no;
  }


}
