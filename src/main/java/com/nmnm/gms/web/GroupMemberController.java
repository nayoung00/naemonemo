package com.nmnm.gms.web;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.service.GroupMemberService;

@Controller
@RequestMapping("/admin")
public class GroupMemberController {

  static Logger logger = LogManager.getLogger(GroupMemberController.class);

  @Autowired
  GroupMemberService groupMemberService;

  public GroupMemberController() {
    logger.debug("GroupMemberController 생성됨!");
  }

  @GetMapping("form")
  public void form() throws Exception {}

  @PostMapping("add")
  public String add(GroupMember groupMember) throws Exception {
    groupMemberService.add(groupMember);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int memberNo) throws Exception {
    if (groupMemberService.delete(memberNo) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 회원 데이터가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int memberNo, Model model) throws Exception {
  	GroupMember groupMember = groupMemberService.get(memberNo);
    model.addAttribute("groupMember", groupMember);
  }

  @GetMapping("gmList")
  public void list(int groupNo, Model model) throws Exception {
    List<GroupMember> groupMembers= groupMemberService.list(groupNo);
//    for(GroupMember gm : groupMembers) {
//    	System.out.println(gm);
//    }
    System.out.println("groupmember/list Test>>>>>>>>>>>>>>");
//    model.addAttribute("groupMember", groupMemberService.get(memberNo));
    model.addAttribute("list", groupMembers);
    System.out.println("Test");
  }
  
  @GetMapping("updateForm")
  public void updateForm(int memberNo, Model model) throws Exception {
    model.addAttribute("groupMember", groupMemberService.get(memberNo));
  }

  @PostMapping("update")
  public String update(GroupMember groupMember) throws Exception {
    if (groupMemberService.update(groupMember) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 회원 데이터가 유효하지 않습니다.");
    }
  }
}
