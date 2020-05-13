package com.nmnm.gms.web;


import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.service.KakaoAPI;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  MemberService memberService;

  @Autowired
  private KakaoAPI kakao;

  @GetMapping("login")
  public void login() {}

  @GetMapping("join")
  public void join() {}


  @PostMapping("join")
  public String join(Member member) throws Exception {
    if (memberService.join(member) > 0) {
      return "redirect:../../index.html";
    } else {
      throw new Exception("회원가입 실패");
    }
  }

  @GetMapping("generalJoin")
  public void addForm() {}

  // @PostMapping("generalJoin")
  // public ModelAndView add(Member member, GeneralMember generalMember, HttpServletRequest request,
  // Model model) throws Exception {
  //
  // if (memberService.add(member, generalMember) > 0) {
  // ModelAndView mv = new ModelAndView();
  // mv.addObject("message1", "입력하신 이메일로 이메일 인증 메일을 발송하였습니다.");
  // mv.addObject("message2", "인증 후 로그인하실 수 있습니다.");
  // mv.setViewName("messageView");
  // // 인증 메일 보내기 메서드
  // mailsender.mailSendWithUserKey(member.getEmail(), member.getId(), member.getName(), request);
  // return mv;
  // } else {
  // throw new Exception("회원을 추가할 수 없습니다.");
  // }
  // }



  @PostMapping("login")
  public String login( //
      String email, //
      String password, //
      String saveEmail, //
      HttpServletResponse response, //
      HttpSession session, //
      Model model) throws Exception {

    Cookie cookie = new Cookie("email", email);
    if (saveEmail != null) {
      cookie.setMaxAge(60 * 60 * 24 * 30);
    } else {
      cookie.setMaxAge(0);
    }
    response.addCookie(cookie);

    Member member = memberService.get(email, password);
    if (member != null) {
      session.setAttribute("loginUser", member);
      System.out.println(member);
      return "redirect:../../index.html";
    } else {
      session.invalidate();
      System.out.println(member);
      return "auth/login";
    }

  }

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }
}
