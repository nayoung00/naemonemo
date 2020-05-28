//package com.nmnm.gms.web;
//
//import java.io.IOException;
//import javax.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//import com.nmnm.gms.socialLogin.NaverLoginBO;
//
//@Controller
//@RequestMapping("/auth")
//public class NaverLoginController {
//
//  /* NaverLoginBO */
//  private NaverLoginBO naverLoginBO;
//
//  /* NaverLoginBO */
//  @Autowired
//  private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
//    this.naverLoginBO = naverLoginBO;
//  }
//
//  @RequestMapping("/login")
//  public ModelAndView login(HttpSession session) {
//    /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
//    String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//
//    /* 생성한 인증 URL을 View로 전달 */
//    return new ModelAndView("login", "url", naverAuthUrl);
//  }
//
//
//  // 로그아웃
//  @RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
//  public String logout(HttpSession session) throws IOException {
//    System.out.println("여기는 logout");
//    session.invalidate();
//    return "redirect:index.jsp";
//  }
//
//
//}
