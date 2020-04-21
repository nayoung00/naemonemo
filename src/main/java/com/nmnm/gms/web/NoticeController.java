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
import com.nmnm.gms.domain.Notice;
import com.nmnm.gms.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

  static Logger logger = LogManager.getLogger(NoticeController.class);
  
  //W@Autowired
  ServletContext servletContext;
  
  //@Autowired
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
  public String delete(int noticeBoardNo) throws Exception {
    if (noticeService.delete(noticeBoardNo) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 공지사항 게시물 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int noticeBoardNo, Model model) throws Exception {
    Notice notice = noticeService.get(noticeBoardNo);
    model.addAttribute("notice", notice);
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", noticeService.list());
  }

  @GetMapping("updateForm")
  public void updateForm(int noticeBoardNo, Model model) throws Exception {
    model.addAttribute("notice", noticeService.get(noticeBoardNo));
  }

  @PostMapping("update")
  public String update(Notice notice) throws Exception {
    if (noticeService.update(notice) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 공지사항 게시물 번호가 유효하지 않습니다.");
    }
  }
  
}
