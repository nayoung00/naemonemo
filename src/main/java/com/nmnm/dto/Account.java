package com.nmnm.dto;

import java.sql.Date;

public class Account {

  private int asset;
  private int amount;
  private Date paymentDate;
  private String remark;
  private String receiptPhoto;

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
