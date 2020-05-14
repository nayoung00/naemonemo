package com.nmnm.gms.domain;

public class GroupAccount {

  private int bankInfoId; // 모임계좌아이디, 모임회계pk
  private int groupNo; // 모임번호, 모임fk
  private String bankAccountNo; // 계좌번호
  private String bankName; // 은행명
  private String openingBalance; // 은행명
  private String bankAccountHolder; // 예금주


  public GroupAccount() {}

  public GroupAccount(//
      String bankAccountNo, //
      String bankName, //
      String openingBalance, //
      String bankAccountHolder) {
    this.bankAccountNo = bankAccountNo;
    this.bankName = bankName;
    this.openingBalance = openingBalance;
    this.bankAccountHolder = bankAccountHolder;
  }

  public String getOpeningBalance() {
    return openingBalance;
  }

  public void setOpeningBalance(String openingBalance) {
    this.openingBalance = openingBalance;
  }

  public int getBankInfoId() {
    return bankInfoId;
  }

  public void setBankInfoId(int bankInfoId) {
    this.bankInfoId = bankInfoId;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public String getBankAccountNo() {
    return bankAccountNo;
  }

  public void setBankAccountNo(String bankAccountNo) {
    this.bankAccountNo = bankAccountNo;
  }

  public String getBankName() {
    return bankName;
  }

  public void setBankName(String bankName) {
    this.bankName = bankName;
  }

  public String getBankAccountHolder() {
    return bankAccountHolder;
  }

  public void setBankAccountHolder(String bankAccountHolder) {
    this.bankAccountHolder = bankAccountHolder;
  }

  @Override
  public String toString() {
    return "GroupAccount [bankInfoId=" + bankInfoId + ", groupNo=" + groupNo + ", bankAccountNo="
        + bankAccountNo + ", bankName=" + bankName + ", openingBalance=" + openingBalance
        + ", bankAccountHolder=" + bankAccountHolder + "]";
  }



}
