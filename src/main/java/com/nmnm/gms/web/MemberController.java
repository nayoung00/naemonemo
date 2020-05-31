package com.nmnm.gms.web;

import java.io.File;
import java.util.UUID;
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
import org.springframework.web.multipart.MultipartFile;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;
import com.nmnm.gms.service.MemberService;

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

  @PostMapping("update")
  public String update( //
      Member member, //
      MultipartFile photoFile) throws Exception {

    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/member");
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      member.setPhoto(filename);
    }

    if (memberService.update(member) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 회원 번호가 유효하지 않습니다.");
    }
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
}
