package com.nmnm.dto;

import java.io.Serializable;
import java.util.List;

// 객체를 serialize 하려면 이 기능을 활성화시켜야 한다.
// - java.io.Serializable을 구현하라!
// - serialize 데이터를 구분하기 위해 버전 번호를 명시하라.
//
public class Group  {


  private int groupNo;
  private String groupName;
  private String groupInfo;
  private int category;
  private String filepath; // 모임사진 파일패스
  private String city;
  private int maxPeopleNo;
  private String bankName;
  private int bankNo;
  private String accountHolder;
  
  public int getGroupNo() {
    
    return groupNo;
  }
  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }
  public String getGroupName() {
    return groupName;
  }
  public void setGroupName(String groupName) {
    this.groupName = groupName;
  }
  public String getGroupInfo() {
    return groupInfo;
  }
  public void setGroupInfo(String groupInfo) {
    this.groupInfo = groupInfo;
  }
  public int getCategory() {
    return category;
  }
  public void setCategory(int category) {
    this.category = category;
  }
  public String getFilepath() {
    return filepath;
  }
  public void setFilepath(String filepath) {
    this.filepath = filepath;
  }
  public String getCity() {
    return city;
  }
  public void setCity(String city) {
    this.city = city;
  }
  public int getMaxPeopleNo() {
    return maxPeopleNo;
  }
  public void setMaxPeopleNo(int maxPeopleNo) {
    this.maxPeopleNo = maxPeopleNo;
  }
  public String getBankName() {
    return bankName;
  }
  public void setBankName(String bankName) {
    this.bankName = bankName;
  }
  public int getBankNo() {
    return bankNo;
  }
  public void setBankNo(int bankNo) {
    this.bankNo = bankNo;
  }
  public String getAccountHolder() {
    return accountHolder;
  }
  public void setAccountHolder(String accountHolder) {
    this.accountHolder = accountHolder;
  }


}


