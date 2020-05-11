package com.nmnm.gms.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {


  @Autowired
  MemberService memberService;

  public void sendMail(Member member) throws Exception {
    // Mail Server 설정
    String charSet = "utf-8";
    String hostSMTP = "smtp.naver.com";
    String hostSMTPid = "아이디";
    String hostSMTPpwd = "비밀번호";

    // 보내는 사람 EMail, 제목, 내용
    String fromEmail = "아이디";
    String fromName = "Spring Homepage";
    String subject = "";
    String msg = "";

    // 회원가입 메일 내용
    subject = "Spring Homepage 회원가입 인증 메일입니다.";
    msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
    msg += "<h3 style='color: blue;'>";
    msg += member.getName() + "님 회원가입을 환영합니다.</h3>";
    msg += "<div style='font-size: 130%'>";
    msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
    msg += "<form method='post' action='http://localhost:8080/nmnm/auth/loginForm'>";
    msg += "<input type='hidden' name='email' value='" + member.getEmail() + "'>";
    // msg += "<input type='hidden' name='approval_key' value='" + member.getApproval_key() + "'>";
    msg += "<input type='submit' value='인증'></form><br/></div>";

    // 받는 사람 E-Mail 주소
    String mail = member.getEmail();
    try {
      HtmlEmail email = new HtmlEmail();
      email.setDebug(true);
      email.setCharset(charSet);
      email.setSSL(true);
      email.setHostName(hostSMTP);
      email.setSmtpPort(587);

      email.setAuthentication(hostSMTPid, hostSMTPpwd);
      email.setTLS(true);
      email.addTo(mail, charSet);
      email.setFrom(fromEmail, fromName, charSet);
      email.setSubject(subject);
      email.setHtmlMsg(msg);
      email.send();
    } catch (Exception e) {
      System.out.println("메일발송 실패 : " + e);
    }
  }


  @GetMapping("loginForm")

  public void loginForm() {}


  @GetMapping("signup")
  public void signup() {}


  @PostMapping("check")
  public String insertMember(@ModelAttribute Member member, RedirectAttributes rttr,
      HttpServletResponse response) throws Exception {
    rttr.addFlashAttribute("result", memberService.insertMember(member, response));

    return "redirect:../../index.html";
  }

  // 이메일 중복검사
  @PostMapping("checkEmail")
  public void checkEmail(@RequestParam("email") String email, HttpServletResponse response)
      throws Exception {
    memberService.checkEmail(email, response);
  }


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
      return "auth/loginForm";
    }

  }

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }
}
