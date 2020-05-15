package com.nmnm.gms.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nmnm.gms.domain.Feed;
import com.nmnm.gms.service.FeedService;

@Controller
@RequestMapping("/feed")
public class FeedController {

  static Logger logger = LogManager.getLogger(NoticeController.class);
  
  @Autowired
  FeedService feedService;

  public FeedController() {
    logger.debug("FeedController 생성됨!");
  }
  
  @GetMapping("form")
  public void form() throws Exception {}


  @PostMapping("add")
  public String add(Feed feed) throws Exception {
    feedService.add(feed);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int feedNo) throws Exception {
    if (feedService.delete(feedNo) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 피드 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int feedNo, Model model) throws Exception {
    model.addAttribute("feed", feedService.get(feedNo));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", feedService.list());
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", feedService.search(keyword));
  }
  
  @GetMapping("updateForm")
  public void updateForm(int feedNo, Model model) throws Exception {
    model.addAttribute("notice", feedService.get(feedNo));
  }

  @PostMapping("update")
  public String update(Feed feed) throws Exception {
    if (feedService.update(feed) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 공지사항 게시물 번호가 유효하지 않습니다." + feed.getFeedNo()
      + " " + feed.getTitle());
    }
  }

  
}