package com.nmnm.gms.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.service.MailService;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {

  Logger logger = LoggerFactory.getLogger(AuthController.class);

  @Autowired
  MemberService memberService;

  @Autowired
  MailService mailService;

  @Autowired
  PasswordEncoder passwordEncoder;

  @ModelAttribute("member")
  public Member newMember() {
    return new Member();
  }

  @GetMapping("/join")
  // constract 페이지를 통해서 왔을때는 flag값으로 1들어오는데
  // 비정상적인 접근일 경우 flag값이 0이 된다
  public String join(@ModelAttribute("member") Member member,
      @RequestParam(value = "flag", defaultValue = "0") String flag, Model model) {
    logger.info(">>> MEMBER/JOIN GET PAGE 출력");
    logger.info(member.toString());
    if (!flag.equals("1")) {
      return "auth/join";
    }

    model.addAttribute("uri", "/nmnm/");
    return "auth/join";
  }

  @PostMapping("/join")
  public String join(@ModelAttribute("member") Member member, SessionStatus sessionStatus,
      HttpServletRequest request, RedirectAttributes rttr) {
    // View단에서 Controller단으로 이동을 잘 했는지 확인됨
    logger.info(">>> MEMBER/JOIN POST DB에 회원정보 저장");

    // View단에서 전송된 데이터가 잘 전달됐는지 확인
    logger.info(member.toString());

    logger.info(member.getPassword()); // 사용자가 입력한 값

    // 1. 사용자 암호 hash변환
    String encPw = passwordEncoder.encode(member.getPassword());
    member.setPassword(encPw); // 암호화된 pw를 DTO에 넣는 과정
    logger.info("hash: " + member.getPassword()); // 사용자가 입력한 pw를 hash로 바꾼 값

    // 2. DB에 회원등록
    // 객체생성을 하지않아도 사용가능 @Autowired로 의존성주입이 되어있음(타입으로함)
    int result = memberService.insert(member);
    // 3. 회원 등록 결과
    if (result > 0) {
      logger.info(">>>>" + member.getName() + "님이 회원가입되었습니다");
    }
    // 4. 회원가입 인증 메일 보내기
    mailService.mailSendUser(member.getEmail(), member.getName(), request);

    sessionStatus.setComplete();

    rttr.addFlashAttribute("name", member.getName());
    rttr.addFlashAttribute("email", member.getEmail());
    rttr.addFlashAttribute("key", "join");

    return "redirect:/";
  }

  @GetMapping("/interest")
  public String viewInterest(Model model, RedirectAttributes rttr) {
    logger.info(">>> MEMBER/INTEREST PAGE 출력");
    model.addAttribute("uri", "/nmnm/");
    // rttr.addFlashAttribute("uri","/ohyoyo/");
    return "auth/interest";
  }

  // 회원가입 후 email인증
  @GetMapping("/keyauth")
  public String keyAuth(String email, String key, RedirectAttributes rttr) {
    mailService.keyAuth(email, key);

    // 인증후 메시지 출력을 위한 값 전달
    rttr.addFlashAttribute("email", email);
    rttr.addFlashAttribute("key", "auth");

    return "redirect:/";
  }

  // 회원가입 ID 중복체크
  @ResponseBody
  @PostMapping(value = "/emailCheck", produces = "application/text; charset=utf-8")
  public String idOverlap(String email) {
    logger.info(">> ID OVERLAP CHECK");
    logger.info(" ID : " + email);
    int cnt = memberService.emailCheck(email);

    String flag = "1";
    if (cnt == 0) {
      flag = "0";
    }
    return flag;
  }


  // 회원정보수정
  @GetMapping("/update")
  public String memUpdate(HttpSession session, Model model) {
    logger.info(">>> GET: MEMBER UPDATE PAGE");

    String email = (String) session.getAttribute("email");

    model.addAttribute("user", memberService.userView(email));

    return "/member/join";
  }

  // 수정한 회원정보 db에 저장하기
  @PostMapping("/update")
  public String memUpdate(Member member, HttpSession session) {
    logger.info(">>> POST: MEMBER UPDATE ACTION");
    logger.info(member.toString());

    memberService.update(member, session);

    return "redirect:/";
  }

  // 비밀번호 변경
  @GetMapping("/pwupdate")
  public String pwUpdate() {
    logger.info(">>> GET: MEMBER PASSWORD UPDATE PAGE");
    // String id = (String) session.getAttribute("userid");
    //
    // // 로그인이 안되있으면 비정상적인 접근으로 간주하여 인텍스페이지로 이동!
    // if(id == null) {
    // return "redirect:/";
    // }

    return "/member/pwupdate";
  }

  // 입력한 비밀번호 변경하러 보내기
  @PostMapping("/pwupdate")
  public String pwUpdate(Member member, HttpSession session) {
    logger.info(">>> POST: MEMBER PASSWORD UPDATE ACTION");

    String encPw = passwordEncoder.encode(member.getPassword());
    member.setPassword(encPw);

    String email = (String) session.getAttribute("email");
    member.setEmail(email);
    logger.info(member.toString());

    memberService.pwUpdate(member);

    return "redirect:/";
  }

  // 비밀번호 유효성체크: 기존에 db에 저장되잇는 정보와 동일한지 확인
  @ResponseBody
  @PostMapping("/pwcheck")
  public Integer pwCheck(String password, HttpSession session) {
    logger.info(">>> POST: PWCHECK(AJAX)");

    String email = (String) session.getAttribute("email");

    return memberService.pwCheck(email, password);
  }

  // 회원탈퇴
  @GetMapping("/drop")
  public String drop(Model model) {
    logger.info(">>> MEMBER/DROP PAGE 출력");

    model.addAttribute("key", "drop");

    return "member/drop";
  }

  // 회원탈퇴 : DB에 저장
  @GetMapping("/dropAction")
  public String dropAction(HttpSession session, RedirectAttributes rttr) {
    logger.info("*********** GET: DROP UPDATE ");
    String email = (String) session.getAttribute("userid");

    rttr.addFlashAttribute("email", email);
    rttr.addFlashAttribute("key", "dropResult");

    memberService.drop(session, email);

    return "redirect:/";
  }

  @GetMapping("/login")
  public String login() {
    return "/login";
  }


  @PostMapping("/login")
  public Integer logIn(Member member, HttpSession session) throws Exception {
    logger.info(">>>>>>>> POST: LOGIN/LOGIN ACTION");

    // 로그인
    int result = memberService.login(member, session);

    logger.info("~~~~~~~~~~~~~~~~결과는 : " + result);

    return result;
  }

  @PostMapping("/logout")
  public void logOut(HttpSession session) throws Exception {
    logger.info(">>>>>>>> POST: LOGOUT/LOGOUT ACTION");
    memberService.logout(session);
  }


}
