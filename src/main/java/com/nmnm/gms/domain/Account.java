package com.nmnm.gms.domain;

import java.sql.Date;

public class Account {
  private int accountNo; // pk, 자동증가, nn
  private int bankNo; // fk from 모임 계좌
  private int groupNo; // fk from 모임, 자동증가
  private int accountTypeNo; // 회계 유형 번호 nn
  private String accountTypeName; // 회계 유형명 nn
  private int assets; // 잔액 nn
  private int amount; // 금액 nn
  private Date paymentDate; // 거래일 nn
  private String remarks; // 비고 null
  private String receiptPhoto; //영수증 사진 null
  
  
  public int getAccountNo() {
    return accountNo;
  }
  public void setAccountNo(int accountNo) {
    this.accountNo = accountNo;
  }
  public int getBankNo() {
    return bankNo;
  }
  public void setBankNo(int bankNo) {
    this.bankNo = bankNo;
  }
  public int getGroupNo() {
    return groupNo;
  }
  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }
  public int getAccountTypeNo() {
    return accountTypeNo;
  }
  public void setAccountTypeNo(int accountTypeNo) {
    this.accountTypeNo = accountTypeNo;
  }
  public String getAccountTypeName() {
    return accountTypeName;
  }
  public void setAccountTypeName(String accountTypeName) {
    this.accountTypeName = accountTypeName;
  }
  public int getAssets() {
    return assets;
  }
  public void setAssets(int assets) {
    this.assets = assets;
  }
  public int getAmount() {
    return amount;
  }
  public void setAmount(int amount) {
    this.amount = amount;
  }
  public Date getPaymentDate() {
    return paymentDate;
  }
  public void setPaymentDate(Date paymentDate) {
    this.paymentDate = paymentDate;
  }
  public String getRemark() {
    return remarks;
  }
  public void setRemark(String remark) {
    this.remarks = remark;
  }
  public String getReceiptPhoto() {
    return receiptPhoto;
  }
  public void setReceiptPhoto(String receiptPhoto) {
    this.receiptPhoto = receiptPhoto;
  }
  



}