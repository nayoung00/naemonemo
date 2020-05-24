package com.nmnm.gms.util;

import java.util.Random;

public class TempKey {

  private int size;
  private boolean lowerCheck;

  public String getKey(int size, boolean lowerCheck) {
    this.size = size;
    this.lowerCheck = lowerCheck;
    return init();
  }

  private String init() {
    Random ran = new Random();
    StringBuffer sb = new StringBuffer();

    int num = 0;

    do {
      num = ran.nextInt(75) + 48;

      if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
        sb.append((char) num);
      } else {
        continue;
      }
    } while (sb.length() < size);

    if (lowerCheck) {
      return sb.toString().toLowerCase();
    }

    return sb.toString();
  }

  // 임시 비밀번호 6자리 생성
  public String createPwKey() {

    int randomNum = 0;
    String smsNumber = "";

    for (int i = 1; i <= 6; i++) {

      randomNum = randomRange(1, 10);

      // for문을 돌려 생성된 int형 숫자를 스트링을으로 변환하면서 더해준다.
      smsNumber = smsNumber + String.valueOf(randomNum);

    }

    return smsNumber;
  }

  public int randomRange(int n1, int n2) {
    return (int) (Math.random() * (n2 - n1)) + n1;
  }
}

