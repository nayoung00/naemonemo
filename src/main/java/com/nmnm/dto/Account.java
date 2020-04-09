package com.nmnm.dto;

import java.sql.Date;

public class Account {

  private int asset; //잔액
  private int amount; //금액 (입금, 출금 포함)
  private Date paymentDate; // 결제일
  private String remark; //비고
  private String receiptPhoto; //영수증 사진

  @Override
  public String toString() {
    return "account [asset=" + asset + ", amount=" + amount + ", paymentDate=" + paymentDate
        + ", remark=" + remark + ", receiptPhoto=" + receiptPhoto + "]";
  }

  public int getAsset() {
    return asset;
  }

  public void setAsset(int asset) {
    this.asset = asset;
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
