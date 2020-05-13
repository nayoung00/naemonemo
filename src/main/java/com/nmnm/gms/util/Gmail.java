package com.nmnm.gms.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication("nemonaemo0@gmail.com", "nmnm5315");


  }
}
