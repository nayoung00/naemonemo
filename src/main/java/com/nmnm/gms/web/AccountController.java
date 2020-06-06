package com.nmnm.gms.web;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.apache.commons.io.FilenameUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.nmnm.gms.domain.Account;
import com.nmnm.gms.domain.Dues;
import com.nmnm.gms.interceptor.Auth;
import com.nmnm.gms.interceptor.Auth.Role;
import com.nmnm.gms.service.AccountService;
import com.nmnm.gms.service.DuesService;

@Auth(role = Role.MEMBER)
@Controller
@RequestMapping("/account")
public class AccountController {

  static Logger logger = LogManager.getLogger(AccountController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  AccountService accountService;

  @Autowired
  DuesService duesService;

  public AccountController() {
    logger.debug("AccountController 생성됨!");
  }

  @GetMapping("form")
  public void form() throws Exception {
  	System.out.println("account form 호출");
  }

  @PostMapping("add")
  public String add( //
      Account account, //
      MultipartFile receiptPhotoFile) throws Exception {
  	System.out.println("account add 호출");
    if (receiptPhotoFile.getSize() > 0) {
    	System.out.println("account 첨부파일 저장");
      String dirPath = servletContext.getRealPath("/upload/account");
      String filename = UUID.randomUUID().toString();
      receiptPhotoFile.transferTo(new File(dirPath + "/" + filename));
      String ext = FilenameUtils.getExtension(receiptPhotoFile.getOriginalFilename());
      String filenamed = FilenameUtils.getBaseName(receiptPhotoFile.getOriginalFilename());
      filename = filenamed + "." + ext;
      account.setReceiptPhoto(filename);
    }
    if (accountService.add(account) > 0) {
    	System.out.println("account add 리턴");
    	return "redirect:list" + "?groupNo=" + account.getGroupNo();
    } else {
    	System.out.println("account add 예외처리");
      throw new Exception("내역을 추가할 수 없습니다.");
    }
  }

  @GetMapping("delete")
  public String delete(int accountNo) throws Exception {
    if (accountService.delete(accountNo) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 공지사항 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int accountNo, Model model) throws Exception {
    Account account = accountService.get(accountNo);
    model.addAttribute("account", account);
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Account> accounts = accountService.list();
    model.addAttribute("list", accounts);
  }

  @GetMapping("updateForm")
  public void updateForm(int accountNo, Model model) throws Exception {
    model.addAttribute("account", accountService.get(accountNo));
  }

  @GetMapping("updatePhotoForm")
  public void updatePhotoForm(int accountNo, Model model) throws Exception {
    model.addAttribute("account", accountService.get(accountNo));
  }

  @PostMapping("update")
  public String update(Account account, //
      MultipartFile receiptPhotoFile) throws Exception {
    if (receiptPhotoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/account");
      String filename = UUID.randomUUID().toString();
      receiptPhotoFile.transferTo(new File(dirPath + "/" + filename));
      String ext = FilenameUtils.getExtension(receiptPhotoFile.getOriginalFilename());
      String filenamed = FilenameUtils.getBaseName(receiptPhotoFile.getOriginalFilename());
      filename = filenamed + "." + ext;
      account.setReceiptPhoto(filename);
    }
    if (accountService.update(account) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 회계 게시물 번호가 유효하지 않습니다." + account.getAccountNo() + " "
          + account.getAccountTypeName());
    }
  }

  // @GetMapping("search")
  // public void search(String keyword, Model model) throws Exception {
  // model.addAttribute("list", accountService.search(keyword));
  // }

  @GetMapping("search")
  public void search(
      @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
      @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
      Model model) throws Exception {
    model.addAttribute("list", accountService.search(startDate, endDate));
  }



  // 회비납부
  @GetMapping("dues")
  public void duesList(Model model) throws Exception {
    List<Dues> duess = duesService.list();
    model.addAttribute("dues", duess);
  }

  // 모임당 회비 안내는 1개씩 존재
  @GetMapping("updateDuesForm")
  public void updateDuesForm(int groupNo, Model model) throws Exception {

    System.out.println("updateDuesForm @@@@@@@@@");
    model.addAttribute("dues", duesService.get(groupNo));
  }

  @PostMapping("updateDues")
  public String updateDues(//
      int groupNo, int entranceFee, //
      String duesPeriod, //
      int dues) throws Exception {
    System.out.println("updateDues @@@@@@@@@");
    System.out.println("updateDues 호출");
    Dues duess = duesService.get(groupNo);

    duess.setEntranceFee(entranceFee);
    duess.setDuesPeriod(duesPeriod);
    duess.setDues(dues);
    duesService.update(duess);
    return "redirect:dues";
  }


}
