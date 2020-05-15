package com.nmnm.gms.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nmnm.gms.domain.GroupAccount;
import com.nmnm.gms.service.GroupAccountService;

@Controller
@RequestMapping("/account")
public class GroupAccountController {

  static Logger logger = LogManager.getLogger(GroupAccountController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  GroupAccountService groupAccountService;

  public GroupAccountController() {
    logger.debug("GroupAccountController 생성됨!");
  }

  @GetMapping("bankForm")
  public void form() throws Exception {}

  @PostMapping("bankAdd")
  public String add(GroupAccount groupAccount) throws Exception {
    groupAccountService.add(groupAccount);
    return "redirect:bankList";
  }

  // @PostMapping("bankAdd")
  // public String add(//
  // int bankInfoId[], //
  // String bankAccountNo[], //
  // String bankName[], //
  // String openingBalance[], //
  // String bankAccountHolder[]) throws Exception {
  // System.out.println("포인트1");
  // System.out.println(bankInfoId);
  // List<Object> arr = Arrays.asList(bankInfoId, bankAccountNo, //
  // bankName, //
  // openingBalance, //
  // bankAccountHolder);
  // System.out.println(bankInfoId);
  // for (Object arrAdd : arr) {
  // GroupAccount groupAccount = (GroupAccount) arrAdd;
  // System.out.println("포인트2");
  // System.out.println(bankInfoId);
  // groupAccountService.add(groupAccount);
  // System.out.println("포인트3");
  // }
  // System.out.println("포인트4");
  // return "redirect:bankList";
  // }

  @GetMapping("bankDelete")
  public String delete(int bankInfoId) throws Exception {
    if (groupAccountService.delete(bankInfoId) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("bankDetail")
  public void detail(int bankInfoId, Model model) throws Exception {
    GroupAccount groupAccount = groupAccountService.get(bankInfoId);
    model.addAttribute("groupAccount", groupAccount);
  }

  @GetMapping("bankList")
  public void list(Model model) throws Exception {
    List<GroupAccount> groupAccounts = groupAccountService.list();
    model.addAttribute("bankList", groupAccounts);
  }

  @GetMapping("bankUpdateForm")
  public void updateForm(int bankInfoId, Model model) throws Exception {
    model.addAttribute("bankNotice", groupAccountService.get(bankInfoId));
  }

  // @PostMapping("bankUpdate")
  // public String update(GroupAccount groupAccount) throws Exception {
  // if (groupAccountService.update(groupAccount) > 0) {
  // return "redirect:bankList";
  // } else {
  // throw new Exception("변경할 공지사항 게시물 번호가 유효하지 않습니다." +
  // groupAccount.getBankInfoId() + " "
  // + groupAccount.getGroupAccountTypeName());
  // }
  // }

  // @GetMapping("search")
  // public void search(String keyword, Model model) throws Exception {
  // model.addAttribute("list", accountService.search(keyword));
  // }

}
