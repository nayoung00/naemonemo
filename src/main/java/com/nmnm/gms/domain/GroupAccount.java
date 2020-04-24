package com.nmnm.gms.domain;

public class GroupAccount {
  String bankNo; // 계좌 번호 PK
  int groupNo; // 모임 번호 fk
  String bank; // 은행 이름
  String accountHolder; // 예금주

  @Override
  public String toString() {
    return "GroupAccount [bankNo=" + bankNo + ", groupNo=" + groupNo + ", bank=" + bank
        + ", accountHolder=" + accountHolder + "]";
  }

  public String getBankNo() {
    return bankNo;
  }

  public void setBankNo(String bankNo) {
    this.bankNo = bankNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public String getBank() {
    return bank;
  }

  public void setBank(String bank) {
    this.bank = bank;
  }

  public String getAccountHolder() {
    return accountHolder;
  }

  public void setAccountHolder(String accountHolder) {
    this.accountHolder = accountHolder;
  }


}
