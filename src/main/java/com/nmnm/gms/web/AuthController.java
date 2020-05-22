package com.nmnm.gms.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  @Autowired
  MemberService memberService;


  @Autowired
  BCryptPasswordEncoder passEncoder;

  // 회원 가입 get
  @RequestMapping(value = "join", method = RequestMethod.GET)
  public void getJoin(Member member) throws Exception {

    logger.info("get join");
  }

  // 회원 가입 post
  @RequestMapping(value = "join", method = RequestMethod.POST)
  public String postJoin(Member member, Model model, RedirectAttributes rttr,
      HttpServletRequest request, HttpSession session) throws Exception {
    logger.info("post join");
    logger.info("회원가입...");


    String email = request.getParameter("email"); // 회원가입 폼에서 넘어오는 데이터들을 받아서 변수에 담음

    Member emailCheck = memberService.emailCheck(email);

    String inputPass = member.getPassword();

    String pass = passEncoder.encode(inputPass);
    member.setPassword(pass);

    memberService.join(member);

    rttr.addFlashAttribute("authmsg", "가입시 사용한 이메일로 인증해주세요");
    return "redirect:/";
  }

  // 에서 Ajax로 email 중복 확인
  @ResponseBody
  @RequestMapping(value = "emailCheck", method = {RequestMethod.GET, RequestMethod.POST})
  public String postIdCheck(HttpServletRequest request) throws Exception {
    logger.info("post emailCheck");

    String email = request.getParameter("email");
    Member emailCheck = memberService.emailCheck(email);

    int result = 0;

    if (emailCheck == null) {
      result = 0;
    } else {
      result = 1;
    }

    return String.valueOf(result);
  }

  // 이메일 인증 다시 보내기
  @RequestMapping(value = "emailAgainSend", method = RequestMethod.POST)
  public String emailAgainSend(Member member) throws Exception {


    memberService.emailAgainSend(member);
    return "emailAgainSuccess";
  }

  // 회원이 이메일 인증 클릭시 리턴받는 정보
  @GetMapping("/emailConfirm")
  public String emailConfirm(String email, Model model) throws Exception {

    memberService.userAuth(email);
    model.addAttribute("name", email);

    // view 아래에 emailConfirm.jsp로 이동
    return "auth/emailConfirm";
  }



  // 로그인 get
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public void getLogin() throws Exception {
    logger.info("get login");

  }

  // 로그인 post
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String postLogin(String email, String password, String saveEmail,
      HttpServletResponse response, HttpSession session, Model model) throws Exception {



    Cookie cookie = new Cookie("email", email);
    if (saveEmail != null) {
      cookie.setMaxAge(60 * 60 * 24 * 30);
    } else {
      cookie.setMaxAge(0);
    }
    response.addCookie(cookie);

    Member member = memberService.get(email, password);
    if (member != null && member.getAuthStatus().equals("N")) {
      session.setAttribute("loginUser", member);
      model.addAttribute("refreshUrl", "2;url=../../index.html");
    } else {
      session.invalidate();
      model.addAttribute("refreshUrl", "2;url=emailAgainFail");
    }

    return "auth/login";
  }

  @GetMapping("emailAgainFail")
  public void emailFail() {}

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }


}
