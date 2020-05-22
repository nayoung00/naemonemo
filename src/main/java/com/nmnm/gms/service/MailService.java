package com.nmnm.gms.service;

import javax.servlet.http.HttpServletRequest;

public interface MailService {
  // 인증 이메일 전송
  public void mailSendUser(String email, String name, HttpServletRequest request);

  // 이메일 인증시 useyn='y'로 Update
  public int keyAuth(String name, String key);
}
