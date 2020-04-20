package com.nmnm.gms.domain;

public class Group {

  private int no; // pk, auto
  private String name;
  private String info;
  private int category;
  private String photo;
  private String city;
  private int maxPeopleNo;
  private String bank;
  private String bankNo;
  private String accountHolder;


  @Override
  public String toString() {
    return "Group [no=" + no + ", name=" + name + ", info=" + info + ", category=" + category
        + ", photo=" + photo + ", city=" + city + ", maxPeopleNo=" + maxPeopleNo + ", bank=" + bank
        + ", bankNo=" + bankNo + ", accountHolder=" + accountHolder + ", getClass()=" + getClass()
        + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
  }


  public int getNo() {
    return no;
  }


  public void setNo(int no) {
    this.no = no;
  }


  public String getName() {
    return name;
  }


  public void setName(String name) {
    this.name = name;
  }


  public String getInfo() {
    return info;
  }


  public void setInfo(String info) {
    this.info = info;
  }


  public int getCategory() {
    return category;
  }


  public void setCategory(int category) {
    this.category = category;
  }


  public String getPhoto() {
    return photo;
  }


  public void setPhoto(String photo) {
    this.photo = photo;
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


  public String getBank() {
    return bank;
  }


  public void setBank(String bank) {
    this.bank = bank;
  }


  public String getBankNo() {
    return bankNo;
  }


  public void setBankNo(String bankNo) {
    this.bankNo = bankNo;
  }


  public String getAccountHolder() {
    return accountHolder;
  }


  public void setAccountHolder(String accountHolder) {
    this.accountHolder = accountHolder;
  }



}
