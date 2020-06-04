package com.nmnm.gms.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Notice;
import com.nmnm.gms.domain.NoticeReply;
import com.nmnm.gms.interceptor.Auth;
import com.nmnm.gms.interceptor.Auth.Role;
import com.nmnm.gms.service.MemberService;
import com.nmnm.gms.service.NoticeReplyService;
import com.nmnm.gms.service.NoticeService;

@Auth(role = Role.MEMBER)
@Controller
@RequestMapping("/notice")
public class NoticeController {

  static Logger logger = LogManager.getLogger(NoticeController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  NoticeService noticeService;

  @Autowired
  NoticeReplyService noticeReplyService;
  
  @Autowired
  MemberService memberService;

  public NoticeController() {
    logger.debug("NoticeController 생성됨!");
  }

  @GetMapping("form")
  public void form() throws Exception {}


  @PostMapping("add")
  public String add( //
      String title, //
      String content, //
      int groupNo, //
      HttpSession httpSession) throws Exception {

    // 세션에 저장된 멤버 객체를 가져옴 // 세션에 저장된 멤버 객체에는 멤버넘버와 인터레스트만 있다
    Member memberInfo = (Member) httpSession.getAttribute("memberInfo");
      
    Notice notice = new Notice();

    notice.setTitle(title);
    notice.setContent(content);
    notice.setGroupNo(groupNo);
    
    // 세션에 저장된 멤버객체의 멤버넘버를 받아서 노티스에 셋햇다
    notice.setMemberNo(memberInfo.getMemberNo());

    noticeService.add(notice);

    return "redirect:list";
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", noticeService.list());
  }

  @GetMapping("detail")
  public void detail(Model model, @RequestParam("noticeNo") int noticeNo) throws Exception {
    model.addAttribute("notice", noticeService.get(noticeNo));

    // 댓글 리스트 보기
    List<NoticeReply> replyList = noticeReplyService.readReply(noticeNo);
    model.addAttribute("replyList", replyList);

    // 게시물 조회수 +1
    noticeService.plusCnt(noticeNo);
  }

  @GetMapping("delete")
  public String delete(int noticeNo) throws Exception {
    noticeService.delete(noticeNo);
    return "redirect:list";
  }

  @GetMapping("updateForm")
  public void updateForm(int noticeNo, Model model) throws Exception {
    model.addAttribute("notice", noticeService.get(noticeNo));
  }

  @PostMapping("update")
  public String update( //
      int noticeNo, //
      String title, //
      String content, //
      int groupNo, //
      int memberNo) throws Exception {

    Notice notice = noticeService.get(noticeNo);

    notice.setTitle(title);
    notice.setContent(content);

    noticeService.update(notice);
    return "redirect:list";
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", noticeService.search(keyword));
  }



  //
  // 댓글 작성
  @RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
  public String replyWrite(NoticeReply noticeReply) throws Exception {

    logger.info("reply Write");

    noticeReplyService.writeReply(noticeReply);
    System.out.println("피드리플라이 한개 추가요");

    return "redirect:detail?noticeNo=" + noticeReply.getNoticeNo();
  }

  // 댓글 수정
  // 댓글 수정 GET
  @RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
  public void replyUpdateView(NoticeReply noticeReply, Model model) throws Exception {
    logger.info("reply Update");

    model.addAttribute("replyUpdate",
        noticeReplyService.selectReply(noticeReply.getNoticeReplyNo()));

  }

  // 댓글 수정 POST
  @RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
  public String replyUpdate(NoticeReply noticeReply) throws Exception {
    logger.info("reply Update");

    noticeReplyService.updateReply(noticeReply);

    return "redirect:detail?noticeNo=" + noticeReply.getNoticeNo();
  }


  // 댓글 삭제
  // 댓글 삭제 GET
  @RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
  public void replyDeleteView(NoticeReply noticeReply, Model model) throws Exception {
    logger.info("reply Delete");

    model.addAttribute("replyDelete",
        noticeReplyService.selectReply(noticeReply.getNoticeReplyNo()));

  }

  // 댓글 삭제 POST
  @RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
  public String replyDelete(NoticeReply noticeReply) throws Exception {
    logger.info("reply Delete");

    noticeReplyService.deleteReply(noticeReply);

    return "redirect:detail?noticeNo=" + noticeReply.getNoticeNo();
  }



}
