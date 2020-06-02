package com.nmnm.gms.domain;

import java.sql.Date;

public class GroupMember {

  private int groupNo; // pk, fk일정참여자,피드, 공지사항
  private int memberNo; // pk, fk일정참여자, 피드, 공지사항
  private int gradeNo; // fk등급
  private int register; // 가입 상태 default=0;
  
  private String photo; // id_photo
  private Date birthday; // birthday
  private String name; // member_name
  private String nickname; // nickname
  
  
  
	@Override
	public String toString() {
		return "GroupMember [groupNo=" + groupNo + ", memberNo=" + memberNo + ", gradeNo=" + gradeNo + ", register="
				+ register + ", photo=" + photo + ", birthday=" + birthday + ", name=" + name + ", nickname=" + nickname + "]";
	}
	
	
	
	
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


}
