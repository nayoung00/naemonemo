package com.nmnm.gms.domain;

public class Dues {
	private int groupNo; // pk, fk, 모임번호
	private int bankInfoId; // pk, fk, 모임계좌아이디
	private int memberNo; // fk, 모임번호
	private int entranceFee; // 입회비
	private String duesPeriod; // 회비납부주기
	private int dues; // 회비금액
	  private String bankAccountNo; // 계좌번호
	  private String bankName; // 은행명

	  
	  
	  
	  
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getEntranceFee() {
		return entranceFee;
	}

	public void setEntranceFee(int entranceFee) {
		this.entranceFee = entranceFee;
	}

	public String getDuesPeriod() {
		return duesPeriod;
	}

	public void setDuesPeriod(String duesPeriod) {
		this.duesPeriod = duesPeriod;
	}

	public int getDues() {
		return dues;
	}

	public void setDues(int dues) {
		this.dues = dues;
	}

	@Override
	public String toString() {
		return "Dues [groupNo=" + groupNo + ", bankInfoId=" + bankInfoId + ", memberNo=" + memberNo + ", entranceFee="
				+ entranceFee + ", duesPeriod=" + duesPeriod + ", dues=" + dues + ", bankAccountNo=" + bankAccountNo
				+ ", bankName=" + bankName + "]";
	}



}
