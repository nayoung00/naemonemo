package com.nmnm.gms.web;

import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.nmnm.gms.service.AccountService;
import com.nmnm.gms.service.GroupService;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {

  static Logger logger = LogManager.getLogger(AdminController.class);
 
  @Autowired
  ServletContext servletContext;
  
  // @Autowired
  //NoticeService noticeService;
  
  // @Autowired
  // NoticeReplyService noticeReplyService;
  
  @Autowired
  GroupService groupService;
  
  @Autowired
  MemberService memberService;
  
  @Autowired
  AccountService accountService;

  public AdminController() {
    logger.debug("AdminController 생성됨!");
  }
  
  // 관리 메뉴 인트로
  @GetMapping("manual")
  public void manual() throws Exception {}

  // 모임관리 페이지
  @GetMapping("groupadmin")
  public void groupAdmin(Model model, @RequestParam("groupNo")int groupNo) throws Exception {
    model.addAttribute("groupAdmin", groupService.get(groupNo));
  }
  
  // 회원관리 페이지
  @GetMapping("memberadmin")
  public void searchGrMember(Model model, int grMemberNo) throws Exception {
    model.addAttribute("searchGrMember", memberService.searchGrMember(grMemberNo));
  }
  
  // 회계관리 페이지
  @GetMapping("accountadmin")
  public void list(Model model) throws Exception {
    model.addAttribute("list", accountService.list());
  }
  
  // 게시판 관리 페이지
  @GetMapping("boardadmin")
  public void form() throws Exception {};
  
  
//
//
//  @PostMapping("add")
//  public String add( //
//      String title, //
//      String content, //
//      int groupNo, //
//      int memberNo) throws Exception {
//
//    Notice notice = new Notice();
//    
//    notice.setTitle(title);
//    notice.setContent(content);
//    notice.setGroupNo(groupNo);
//    notice.setMemberNo(memberNo);
//    
//    noticeService.add(notice);
//    
//    return "redirect:list";
//  }
  
//  @GetMapping("list")
//  public void moim(Model model) throws Exception {
//    model.addAttribute("list", groupService.list());
//  }

//  @GetMapping("detail")
//  public void detail(Model model, @RequestParam("noticeNo")int noticeNo) throws Exception {
//    model.addAttribute("notice", noticeService.get(noticeNo));
//    
//    // 댓글 리스트 보기
//    List<NoticeReply> replyList = noticeReplyService.readReply(noticeNo);
//    model.addAttribute("replyList", replyList);
//    
//    // 게시물 조회수 +1
//    noticeService.plusCnt(noticeNo);
//  }
//
//  @GetMapping("delete")
//  public String delete(int noticeNo) throws Exception {
//    noticeService.delete(noticeNo);
//    return "redirect:list";
//  }
//
//  @GetMapping("updateForm")
//  public void updateForm(int noticeNo, Model model) throws Exception {
//    model.addAttribute("notice", noticeService.get(noticeNo));
//  }
//
//  @PostMapping("update")
//  public String update( //
//      int noticeNo, //
//      String title, //
//      String content, //
//      int groupNo, //
//      int memberNo) throws Exception {
//    
//    Notice notice = noticeService.get(noticeNo);
//    
//    notice.setTitle(title);
//    notice.setContent(content);
//    
//    noticeService.update(notice);
//    return "redirect:list";
//  }
//  
//    @GetMapping("search")
//    public void search(String keyword, Model model) throws Exception {
//      model.addAttribute("list", noticeService.search(keyword));
//    }
//    
//    
//    
//    //
//    //댓글 작성
//    @RequestMapping(value="/replyWrite", method = RequestMethod.POST)
//    public String replyWrite(NoticeReply noticeReply) throws Exception {
//        
//        logger.info("reply Write");
//        
//        noticeReplyService.writeReply(noticeReply);
//        System.out.println("피드리플라이 한개 추가요");
//        
//        return "redirect:detail?noticeNo=" + noticeReply.getNoticeNo();
//    }
//     
//    //댓글 수정 
//    //댓글 수정 GET
//    @RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
//    public void replyUpdateView(NoticeReply noticeReply, Model model) throws Exception {
//        logger.info("reply Update");
//        
//        model.addAttribute("replyUpdate", noticeReplyService.selectReply(noticeReply.getNoticeReplyNo()));
//        
//    }
//    
//    //댓글 수정 POST
//    @RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
//    public String replyUpdate(NoticeReply noticeReply) throws Exception {
//        logger.info("reply Update");
//        
//        noticeReplyService.updateReply(noticeReply);
//        
//        return "redirect:detail?noticeNo=" + noticeReply.getNoticeNo();
//    }
//    
//    
//    //댓글 삭제
//    //댓글 삭제 GET
//    @RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
//    public void replyDeleteView(NoticeReply noticeReply, Model model) throws Exception {
//        logger.info("reply Delete");
//        
//        model.addAttribute("replyDelete", noticeReplyService.selectReply(noticeReply.getNoticeReplyNo()));
//
//    }
//    
//    //댓글 삭제 POST
//    @RequestMapping(value="/replyDelete", method = RequestMethod.POST)
//    public String replyDelete(NoticeReply noticeReply) throws Exception {
//        logger.info("reply Delete");
//        
//        noticeReplyService.deleteReply(noticeReply);
//        
//        return "redirect:detail?noticeNo=" + noticeReply.getNoticeNo();
//    }
//    


}
