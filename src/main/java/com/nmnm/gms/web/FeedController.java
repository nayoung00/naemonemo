package com.nmnm.gms.web;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
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
    if (feedService.add(feed) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("피드를 추가할 수 없습니다.");
    }
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

  @PostMapping("update")
  public String update(Feed feed, MultipartFile thumbnail) throws Exception {

    if (thumbnail.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/feed");
      String filename = UUID.randomUUID().toString();
      thumbnail.transferTo(new File(dirPath + "/" + filename));
      feed.setThumbnail(filename);
    }

    if (feedService.update(feed) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 피드 번호가 유효하지 않습니다.");
    }
  }
}
