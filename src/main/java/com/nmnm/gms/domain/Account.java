package com.nmnm.gms.domain;

import java.sql.Date;

public class Account {
  private int asset; // pk
  private int groupNo; // fk from 모임, 자동증가
  private int amount;
  private Date paymentDate;
  private int accountTypeNo; // fk from 회계유형
  private String remark;
  private String receiptPhoto;

  public int getAsset() {
    return asset;
  }

  public void setAsset(int asset) {
    this.asset = asset;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
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

  public int getAccountTypeNo() {
    return accountTypeNo;
  }

  public void setAccountTypeNo(int accountTypeNo) {
    this.accountTypeNo = accountTypeNo;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public String getReceiptPhoto() {
    return receiptPhoto;
  }

  public void setReceiptPhoto(String receiptPhoto) {
    this.receiptPhoto = receiptPhoto;
  }


}