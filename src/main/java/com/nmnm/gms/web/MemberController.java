package com.nmnm.gms.web;

import java.sql.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;
import com.nmnm.gms.interceptor.Auth;
import com.nmnm.gms.interceptor.Auth.Role;
import com.nmnm.gms.service.MemberService;

@Auth(role = Role.MEMBER)
@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  MemberService memberService;

  @GetMapping("pwupdate")
  public void pwupdate() {}


  @GetMapping("form")
  public void form() {}

  @GetMapping("sendForm")
  public void sendForm(int no, Model message, HttpServletRequest request) throws Exception {
    message.addAttribute("receiver", memberService.sender(no));
    message.addAttribute("sender", request.getSession().getAttribute("loginUser"));
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("member", memberService.get(no));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", memberService.list());
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", memberService.search(keyword));
  }

  // 마이페이지
  @GetMapping("/mypage")
  public String mypage() {
    return "member/mypage";
  }

  @PostMapping("send")
  public String send(Member loginUser, Message message, HttpSession session) throws Exception {
    loginUser = (Member) session.getAttribute("loginUser");
    if (memberService.send(message) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("쪽지를 보낼 수 없습니다.");
    }
  }

  @RequestMapping(value = "changePassword", method = RequestMethod.POST)
  public String postChangePassword(HttpSession session, HttpServletRequest request, Member member)
      throws Exception {

    String password = request.getParameter("password");

    member.setEmail(member.getEmail());
    member.setPassword(password);

    memberService.changePassword(member);

    return "member/changePassSuccess";
  }


  @GetMapping("changePassSuccess")
  public String changePassSuccess() {
    return "member/changePassSuccess";
  }

  @GetMapping("update")
  public void update() {}

  @PostMapping("update")
  public String update(Member member, HttpServletRequest request) throws Exception {

    // if (file.getSize() > 0) {
    // String dirPath = servletContext.getRealPath("/upload/member");
    // String filename = UUID.randomUUID().toString();
    // file.transferTo(new File(dirPath + "/" + filename));
    // member.setPhoto(filename);
    // }
    System.out.println("업데이트4444");

    HttpSession session = request.getSession(false);
    System.out.println("업데이트111");
    //
    member.setMemberNo(member.getMemberNo());
    System.out.println("업데이트222");
    String name = request.getParameter("name");
    String nickname = request.getParameter("nickname");
    Date birthday = Date.valueOf(request.getParameter("birthday"));
    String intro = request.getParameter("intro");
    String interest = request.getParameter("interest");
    member.setName(name);
    member.setNickname(nickname);
    member.setBirthday(birthday);
    member.setIntro(intro);
    member.setInterest(interest);
    System.out.println("업데이트333");

    String[] arr = request.getParameterValues("interest");


    System.out.println("파라미터이름:" + request.getParameterNames());
    session.setAttribute("loginUser", member);
    System.out.println(member);
    System.out.println(member.getName());
    System.out.println(memberService.update(member));
    if (memberService.update(member) > 0) {
      return "member/mypage";
    } else {
      throw new Exception("변경할 회원 번호가 유효하지 않습니다.");
    }
  }
}
