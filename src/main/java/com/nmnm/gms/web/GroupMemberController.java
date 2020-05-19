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
    if (groupService.addgrmember(grMember) > 0) {
      return "redirect:../group/list";
    } else {
      throw new Exception("그룹에 가입할 수 없습니다.");
    }
  }

  @GetMapping("search")
  public void searchGrMember(int memberNo, Model model) throws Exception {
    model.addAttribute("search", memberService.searchGrMember(memberNo));
    // return "redirect:list";
  }
}
