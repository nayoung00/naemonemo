package com.nmnm.gms.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.service.GroupService;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/grmember")
public class GroupMemberController {

  @Autowired
  MemberService memberService;

  @Autowired
  GroupService groupService;

  @GetMapping("add")
  public void add() throws Exception {
    // return "redirect:add";
  }

  @GetMapping("list")
  public void list() throws Exception {}

  @GetMapping("addgrmember")
  public String addgrmember(GroupMember grMember) throws Exception {
    if (grMember.getRegister() == 0) {
      if (groupService.addGrMember(grMember) > 0) {
        memberService.approvalGrMember(grMember);
        return "redirect:../group/list";
      } else {
        return "redirect:../error";
      }
    } else {
      throw new Exception("이미 가입된 회원입니다.");
    }
  }

  @GetMapping("search")
  public void searchGrMember(int memberNo, Model model) throws Exception {
    model.addAttribute("search", memberService.searchGrMember(memberNo));
    // return "redirect:list";
  }
}
