package com.nmnm.gms.web;

import java.util.List;
import javax.servlet.ServletContext;
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

  @Autowired
  ServletContext servletContext;

  @Autowired
  FeedService feedService;

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
    Feed feed = feedService.get(feedNo);
    model.addAttribute("feed", feed);
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Feed> feeds = feedService.list();
    model.addAttribute("list", feeds);
  }

  @PostMapping("update")
  public String update(Feed feed) throws Exception {
    if (feedService.update(feed) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 피드 번호가 유효하지 않습니다.");
    }
  }
}