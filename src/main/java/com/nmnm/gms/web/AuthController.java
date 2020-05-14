package com.nmnm.gms.web;


import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.service.MailSendService;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  MemberService memberService;

  @Autowired
  private MailSendService mailsender;


  @GetMapping("login")
  public void login() {}

  @GetMapping("join")
  public void join() {}


  @PostMapping("join")
  public ModelAndView join(Member member, HttpServletRequest request, MultipartFile photoFile)
      throws Exception {
    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/member");
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      member.setPhoto(filename);
    }
    if (memberService.add(member) > 0) {
      ModelAndView mv = new ModelAndView();
      mv.addObject("message1", "입력하신 이메일로 이메일 인증 메일을 발송하였습니다.");
      mv.addObject("message2", "인증 후 로그인하실 수 있습니다.");
      mv.setViewName("messageView");
      // 인증 메일 보내기 메서드
      mailsender.mailSendWithKey(member.getEmail(), member.getName(), request);
      return mv;
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }

  }

  @GetMapping("generalJoin")
  public void addForm() {}


  @ResponseBody
  @RequestMapping(value = "checkid", method = RequestMethod.POST)
  public int checkid(String email) throws Exception {
    int count = memberService.checkid(email);
    return count;
  }

  @ResponseBody
  @RequestMapping(value = "checknick", method = RequestMethod.POST)
  public int checknick(String nickname) throws Exception {
    System.out.println(nickname);
    int count = memberService.checknick(nickname);
    return count;
  }

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
    if (member != null) {
      session.setAttribute("loginUser", member);
      model.addAttribute("refreshUrl", "2;url=../../index.html");
    } else {
      session.invalidate();
      model.addAttribute("refreshUrl", "2;url=login");
    }

    return "auth/loginForm";
  }

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }

  @GetMapping("findPassword")
  public void findPasswordForm() {}

  @PostMapping("findPassword")
  public String findPassword(String email, Model model) throws Exception {
    String userEmail = memberService.getEmailByEmail(email);

    if (userEmail != null) {
      model.addAttribute("email", email);
      mailsender.findPassword(email);
      return "redirect:/";
    } else {
      model.addAttribute("error", "해당 이메일은 가입된 이메일이 아닙니다.");
      return "redirect:./";
    }
  }
}
