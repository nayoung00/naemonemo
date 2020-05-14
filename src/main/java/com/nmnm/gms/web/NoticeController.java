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
import com.nmnm.gms.domain.Notice;
import com.nmnm.gms.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

  static Logger logger = LogManager.getLogger(NoticeController.class);
 
  @Autowired
  NoticeService noticeService;

  public NoticeController() {
    logger.debug("NoticeController 생성됨!");
  }
  
  @GetMapping("form")
  public void form() throws Exception {}


  @PostMapping("add")
  public String add(Notice notice) throws Exception {
    noticeService.add(notice);
    return "redirect:list";
  }
  
  @GetMapping("delete")
  public String delete(int noticeNo) throws Exception {
    if (noticeService.delete(noticeNo) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 공지사항 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int noticeNo, Model model) throws Exception {
    Notice notice = noticeService.get(noticeNo);
    model.addAttribute("notice", notice);
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Notice> notices = noticeService.list();
    model.addAttribute("list", notices);
  }

  @GetMapping("updateForm")
  public void updateForm(int noticeNo, Model model) throws Exception {
    model.addAttribute("notice", noticeService.get(noticeNo));
  }

  @PostMapping("update")
  public String update(Notice notice) throws Exception {
    if (noticeService.update(notice) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 공지사항 게시물 번호가 유효하지 않습니다." + notice.getNoticeNo()
      + " " + notice.getTitle());
    }
  }
  
    @GetMapping("search")
    public void search(String keyword, Model model) throws Exception {
      model.addAttribute("list", noticeService.search(keyword));
    }
  
}
