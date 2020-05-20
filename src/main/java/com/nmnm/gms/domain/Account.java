package com.nmnm.gms.domain;

import java.sql.Date;

public class Account {
  private int accountNo; // pk, 자동증가, nn
  private int groupNo; // fk, 모임번호
  private int bankInfoId; // fk, 모임계좌아이디
  private String accountTypeName; // 회계 유형명 nn
  private int deposit; // 입금
  private int withdraw; // 출금
  private Date paymentDate; // 거래일 nn
  private String accountConnection; // 거래처 null
  private String remarks; // 비고 null
  private String receiptPhoto; // 영수증 사진 null
  private String endingBalance; // 은행명

  public int getAccountNo() {
    return accountNo;
  }

  public void setAccountNo(int accountNo) {
    this.accountNo = accountNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public int getBankInfoId() {
    return bankInfoId;
  }

  public void setBankInfoId(int bankInfoId) {
    this.bankInfoId = bankInfoId;
  }

  public String getAccountTypeName() {
    return accountTypeName;
  }

  public void setAccountTypeName(String accountTypeName) {
    this.accountTypeName = accountTypeName;
  }

  public int getDeposit() {
    return deposit;
  }

  public void setDeposit(int deposit) {
    this.deposit = deposit;
  }

  public int getWithdraw() {
    return withdraw;
  }

  public void setWithdraw(int withdraw) {
    this.withdraw = withdraw;
  }

  public Date getPaymentDate() {
    return paymentDate;
  }

  public void setPaymentDate(Date paymentDate) {
    this.paymentDate = paymentDate;
  }

  public String getAccountConnection() {
    return accountConnection;
  }

  public void setAccountConnection(String accountConnection) {
    this.accountConnection = accountConnection;
  }

  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }

  public String getReceiptPhoto() {
    return receiptPhoto;
  }

  public void setReceiptPhoto(String receiptPhoto) {
    this.receiptPhoto = receiptPhoto;
  }

  public String getEndingBalance() {
    return endingBalance;
  }

  public void setEndingBalance(String endingBalance) {
    this.endingBalance = endingBalance;
  }

  @Override
  public String toString() {
    return "Account [accountNo=" + accountNo + ", groupNo=" + groupNo + ", bankInfoId=" + bankInfoId
        + ", accountTypeName=" + accountTypeName + ", deposit=" + deposit + ", withdraw=" + withdraw
        + ", paymentDate=" + paymentDate + ", accountConnection=" + accountConnection + ", remarks="
        + remarks + ", receiptPhoto=" + receiptPhoto + ", endingBalance=" + endingBalance + "]";
  }



}
