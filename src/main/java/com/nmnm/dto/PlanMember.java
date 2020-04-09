package com.nmnm.dto;

public class PlanMember {

  private int planBoardNo; // nm_plan PK/ PK NN
  private int memberNo; // nm_meeting_member PK/ PK NN
  private int groupNo; // nm_meeting_member PK/ PK NN
  private int attend; // nm_plan_member NN default=0 미정,불참,참가

  @Override
  public String toString() {
    return "PlanMember [planBoardNo=" + planBoardNo + ", memberNo=" + memberNo + ", groupNo="
        + groupNo + ", attend=" + attend + "]";
  }

  public int getPlanBoardNo() {
    return planBoardNo;
  }

  public void setPlanBoardNo(int planBoardNo) {
    this.planBoardNo = planBoardNo;
  }

  public int getMemberNo() {
    return memberNo;
  }

  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }

  public int getGroupNo() {
    return groupNo;
  }

  public void setGroupNo(int groupNo) {
    this.groupNo = groupNo;
  }

  public int getAttend() {
    return attend;
  }

  public void setAttend(int attend) {
    this.attend = attend;
  }
}
