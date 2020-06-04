package com.nmnm.gms.web;

import java.beans.PropertyEditorSupport;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;
import com.nmnm.gms.interceptor.Auth;
import com.nmnm.gms.interceptor.Auth.Role;

@Auth(role = Role.MEMBER)
@ControllerAdvice
public class GlobalControllerAdvice {

  @InitBinder
  public void initBinder(WebDataBinder binder) {

    // String 날짜 ==> java.sql.Date 객체
    binder.registerCustomEditor( //
        java.util.Date.class, //
        new PropertyEditorSupport() { //
          @Override
          public void setAsText(String text) throws IllegalArgumentException {
            setValue(java.sql.Date.valueOf(text));
          }
        });
  }
}
