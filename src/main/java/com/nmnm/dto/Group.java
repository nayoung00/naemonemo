package com.nmnm.domain;

import java.io.Serializable;
import java.util.List;

// 객체를 serialize 하려면 이 기능을 활성화시켜야 한다.
// - java.io.Serializable을 구현하라!
// - serialize 데이터를 구분하기 위해 버전 번호를 명시하라.
//
public class Group implements Serializable {

  private static final long serialVersionUID = 20200406L;

  private int groupNo;
  private String groupName;
  private String groupInfo;
  private int category;
  private List<GroupPhotoFile> files;
  private String region;
  private int maxPeopleNo;
  private String bankName;
  private int bankNo;
  private String accountHolder;


}


