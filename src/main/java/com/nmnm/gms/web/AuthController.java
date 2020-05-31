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
import org.springframework.web.bind.annotation.PostMapping;
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
    memberService.join(member);


    rttr.addFlashAttribute("authmsg", "가입시 사용한 이메일로 인증해주세요");
    return "redirect:/";
  }

  @ResponseBody
  @RequestMapping(value = "emailCheck", method = RequestMethod.POST)
  public int emailCheck(String email) throws Exception {
    System.out.println(email);
    int count = memberService.emailCheck(email);
    System.out.println(count);
    return count;
  }


  // 회원이 이메일 인증 클릭시 리턴받는 정보
  @GetMapping("/emailConfirm")
  public String emailConfirm(String email, Model model) throws Exception {

    memberService.userAuth(email);
    model.addAttribute("name", email);

    // view 아래에 emailConfirm.jsp로 이동
    return "auth/emailConfirm";
  }



  @GetMapping("login")
  public void login() {}

  @PostMapping("login")
  public String login(String email, String password, String saveEmail, HttpServletResponse response,
      HttpSession session, Model model) throws Exception {
    Cookie cookie = new Cookie("email", email);
    if (saveEmail != null) {
      cookie.setMaxAge(60 * 60 * 24 * 30);
    } else {
      cookie.setMaxAge(0);
    }
    response.addCookie(cookie);

    Member member = memberService.get(email, password);
    System.out.println(member);
    if (member != null) {
      if (member.getAuthStatus().equals("N")) {
        return "redirect:emailAgainFail";
      }
      session.setAttribute("loginUser", member);
      model.addAttribute("refreshUrl", "2;url=../../index.html");
    } else {
      session.invalidate();
      model.addAttribute("refreshUrl", "2;url=login");
    }
    return "auth/loginForm";
  }


  @GetMapping("emailAgainFail")
  public void emailFail() {}

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }

  @GetMapping("callback")
  public void callback() {}

  @PostMapping("resetPassword")
  public void resetPassword() {}


  @GetMapping("findPassword")
  public void findPasswordForm() {}

  @PostMapping("findPassword")
  public String findPassword(String name, String email, Model model) throws Exception {
    System.out.println("비밀번호를 찾아줘!");
    int user = memberService.findPassword(name, email);
    System.out.println("=======================================>" + user);
    if (user == 1) {
      model.addAttribute("email", email);
      return "redirect:/";
    } else {
      throw new Exception("일치하는 회원이 없습니다.");
    }
  }

  // 메일로 리턴받은 정보를 가지고 패스워드 변경 페이지로 세션에 이메일을담아 보냄
  @RequestMapping(value = "returnResetPass", method = {RequestMethod.GET, RequestMethod.POST})
  public String postRetrunResetPass(HttpSession session, HttpServletRequest request, Model model)
      throws Exception {

    String email = request.getParameter("email");

    session.setAttribute("email", email);

    return "redirect:/auth/pwResetChange.jsp";

  }



}
