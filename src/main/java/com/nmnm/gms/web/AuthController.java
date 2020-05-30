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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.service.MemberService;
import com.nmnm.gms.socialLogin.NaverLoginBO;
import com.nmnm.gms.util.TempKey;

@Controller
@RequestMapping("/auth")
public class AuthController {
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  @Autowired
  MemberService memberService;

  private NaverLoginBO naverLoginBO;
  private String apiResult = null;

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
    // String hashedPw = BCrypt.hashpw(member.getPassword(), BCrypt.gensalt());
    // member.setPassword(hashedPw);
    memberService.join(member);


    rttr.addFlashAttribute("authmsg", "가입시 사용한 이메일로 인증해주세요");
    return "redirect:/";
  }

  @RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
  public @ResponseBody String emailCheck(@ModelAttribute("member") Member member, Model model)
      throws Exception {
    int result = memberService.emailCheck(member.getEmail());
    return String.valueOf(result);
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

  // && member.getAuthStatus().equals("N")

  @GetMapping("emailAgainFail")
  public void emailFail() {}

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }

  @GetMapping("callback")
  public void callback() {}


  @GetMapping("pwReset")
  public void pwReset() {}

  // 패스워드 리셋 메소드
  @PostMapping("resetPassword")
  public String postResetPassword(HttpSession session, HttpServletRequest request, Member member)
      throws Exception {

    String email = request.getParameter("email");

    Member findAccount = memberService.findAccount(email);

    if (findAccount != null) {

      String name = findAccount.getName();

      String tempPass = new TempKey().createPwKey();

      String pass = passEncoder.encode(tempPass); // 랜덤으로 생성된 6자리 비밀번호를 암호화해서 저장

      member.setEmail(email);
      member.setPassword(pass);
      member.setName(name);

      memberService.resetPassword(member);

    } else {

      return "auth/findAccountFail";
    }

    return "auth/resetPassword";
  }

  // 메일로 리턴받은 정보를 가지고 패스워드 변경 페이지로 세션에 이메일을담아 보냄
  @RequestMapping(value = "returnResetPass", method = {RequestMethod.GET, RequestMethod.POST})
  public String postRetrunResetPass(HttpSession session, HttpServletRequest request, Model model)
      throws Exception {

    String email = request.getParameter("email");

    session.setAttribute("email", email);

    return "redirect:/auth/pwResetChange.jsp";

  }

  // 리셋된 이메일을 통해 변경하는 패스워드 변경과 일반 변경시 사용
  @RequestMapping(value = "changePassword", method = RequestMethod.POST)
  public String postChangePassword(HttpSession session, HttpServletRequest request, Member member)
      throws Exception {

    String password = request.getParameter("password");

    // 넘어온 비밀번호를 암호화하여 저장
    String pass = passEncoder.encode(password);

    member.setEmail(member.getEmail());
    member.setPassword(pass);

    memberService.changePassword(member);

    session.invalidate();

    return "changePassSuccess";


  }



}
