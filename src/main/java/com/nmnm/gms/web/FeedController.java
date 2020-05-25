package com.nmnm.gms.web;

import java.io.File;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.nmnm.gms.domain.Feed;
import com.nmnm.gms.domain.FeedPhoto;
import com.nmnm.gms.service.FeedService;

@Controller
@RequestMapping("/feed")
public class FeedController {

  static Logger logger = LogManager.getLogger(NoticeController.class);
  
  @Autowired
  ServletContext servletContext;
  
  @Autowired
  FeedService feedService;

  public FeedController() {
    logger.debug("FeedController 생성됨!");
  }
  
  @GetMapping("form")
  public void form() throws Exception {}


  @PostMapping("add")
  public String add(Feed feed, //
      MultipartFile[] FeedPhotos) throws Exception {
    feedService.add(feed);
    
    List<FeedPhoto> feedPhotos = new LinkedList<>();
    for (MultipartFile photoFile : FeedPhotos) {
      if (photoFile.getSize() > 0) {
        FeedPhoto feedPhoto = new FeedPhoto();
        String dirPath = servletContext.getRealPath("/upload/feed");
        String filename = UUID.randomUUID().toString();
        photoFile.transferTo(new File(dirPath + "/" + filename));
        feedPhoto.setPhotoFile(filename);
        feedPhotos.add(feedPhoto);
      }
    }
    
    
    return "redirect:list";
  }

  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", feedService.list());
  }

  @GetMapping("detail")
  public void detail(int feedNo, Model model) throws Exception {
    model.addAttribute("feed", feedService.get(feedNo));
  }

  
  @GetMapping("delete")
  public String delete(int feedNo) throws Exception {
    if (feedService.delete(feedNo) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 피드 번호가 유효하지 않습니다.");
    }
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
      throw new Exception("변경 피드 게시물 번호가 유효하지 않습니다." + feed.getFeedNo()
      + " " + feed.getTitle());
    }
  }

  
}