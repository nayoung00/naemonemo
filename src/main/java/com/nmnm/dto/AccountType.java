package com.nmnm.dto;

public class AccountType {

  private int accountTypeNo; //회계유형번호
  private String accountTypeName; // 계정과목
  
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

}
