package com.nmnm.gms.domain;

public class PlanMember {

  public PlanMember() {
    setAttend("불참");
  }

  private int planNo; // nm_plan PK/ PK NN
  private int memberNo; // nm_meeting_member PK/ PK NN
  private String memberName;
  private int groupNo; // nm_meeting_member PK/ PK NN
  private String attend; // nm_plan_member NN default=0 미정,불참,참가


  @Override
  public String toString() {
    return "PlanMember [planNo=" + planNo + ", memberNo=" + memberNo + ", memberName=" + memberName
        + ", groupNo=" + groupNo + ", attend=" + attend + "]";
  }
  public int getPlanNo() {
    return planNo;
  }
  public void setPlanNo(int planNo) {
    this.planNo = planNo;
  }
  public int getMemberNo() {
    return memberNo;
  }
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  public String getMemberName() {
    return memberName;
  }
  public void setMemberName(String memberName) {
    this.memberName = memberName;
  }
  public int getGroupNo() {
    return groupNo;
  }
  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }
  public String getAttend() {
    return attend;
  }
  public void setAttend(String attend) {
    this.attend = attend;
  }


}
