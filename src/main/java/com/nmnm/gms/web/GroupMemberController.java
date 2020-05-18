package com.nmnm.gms.web;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.service.GroupService;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/grmember")
public class GroupMemberController {

  @Autowired
  MemberService memberService;

  @Autowired
  GroupService groupService;

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", groupService.list());
  }

  @PostMapping("add")
  public String add(GroupMember grMember, Member loginUser, HttpSession session) throws Exception {
    loginUser = (Member) session.getAttribute("loginUser");
    if (loginUser == null) {
      return "redirect:../../auth/login";
    } else if (groupService.add(grMember) > 0) {
      return "redirect:list";
    }
    throw new Exception("그룹에 가입하실수 없습니다.");
  }
}
