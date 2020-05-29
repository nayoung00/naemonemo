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
import com.nmnm.gms.domain.NoticeReply;
import com.nmnm.gms.service.NoticeReplyService;

@Controller
@RequestMapping("/notice")
public class NoticeReplyController {

  static Logger logger = LogManager.getLogger(NoticeReplyController.class);
 
  @Autowired
  NoticeReplyService noticeReplyService;

  public NoticeReplyController() {
    logger.debug("NoticeReplyController 생성됨!");
  }
  
  @GetMapping("replyform")
  public void form() throws Exception {}


  @PostMapping("replyadd")
  public String add(NoticeReply noticeReply) throws Exception {
    noticeReplyService.add(noticeReply);
    return "redirect:replylist";
  }
  
  @GetMapping("replydelete")
  public String delete(int noticeReplyNo) throws Exception {
    if (noticeReplyService.delete(noticeReplyNo) > 0) {
      return "redirect:replylist";
    } else {
      throw new Exception("삭제할 댓글 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("replydetail")
  public void detail(int noticeReplyNo, Model model) throws Exception {
    NoticeReply noticeReply = noticeReplyService.get(noticeReplyNo);
    model.addAttribute("noticeReply", noticeReply);
  }

  @GetMapping("replylist")
  public void list(Model model) throws Exception {
    List<NoticeReply> noticeReplys = noticeReplyService.list();
    model.addAttribute("replylist", noticeReplys);
  }

  @GetMapping("replyupdateForm")
  public void updateForm(int noticeReplyNo, Model model) throws Exception {
    model.addAttribute("noticeReply", noticeReplyService.get(noticeReplyNo));
  }

  @PostMapping("replyupdate")
  public String update(NoticeReply noticeReply) throws Exception {
    if (noticeReplyService.update(noticeReply) > 0) {
      return "redirect:replylist";
    } else {
      throw new Exception("변경할 댓글 번호가 유효하지 않습니다." + noticeReply.getNoticeReplyNo()
      + " " + noticeReply.getContent());
    }
  }
  
  @GetMapping("replysearch")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("replylist", noticeReplyService.search(keyword));
  }
  
}
