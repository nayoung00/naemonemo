package com.nmnm.gms.domain;

public class Grade {

  private int no; // pk
  private String name;



  @Override
  public String toString() {
    return "Grade [no=" + no + ", name=" + name + "]";
  }


  public int getNo() {
    return no;
  }



  public void setNo(int no) {
    this.no = no;
  }



  public String getName() {
    return name;
  }



  public void setName(String name) {
    this.name = name;
  }



}
