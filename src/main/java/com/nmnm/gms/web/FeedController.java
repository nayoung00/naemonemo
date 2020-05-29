package com.nmnm.gms.web;

import java.io.File;
import java.util.ArrayList;
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

  static Logger logger = LogManager.getLogger(FeedController.class);

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
  public String add( //
      String title, //
      String content, //
      int groupNo, //
      int memberNo, //
      MultipartFile[] feedPhotos) throws Exception {
    
    Feed feed = new Feed();
    
    feed.setTitle(title);
    feed.setContent(content);
    feed.setGroupNo(groupNo);
    feed.setMemberNo(memberNo);

    ArrayList<FeedPhoto> feedPhotoArray = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/feed");
    System.out.println("1");
    for (MultipartFile feedPhoto : feedPhotos) {
      if (feedPhoto.getSize() <= 0) {
        continue;
      }
      System.out.println("2");
      String filename = UUID.randomUUID().toString();
      System.out.println("3");
      feedPhoto.transferTo(new File(dirPath + "/" + filename));
      System.out.println("4");
      feedPhotoArray.add(new FeedPhoto().setFilepath(filename));
      System.out.println("5");
    }
    
    if (feedPhotoArray.size() == 0) {
      throw new Exception("최소 한 개의 사진 파일을 등록해야 합니다.");
    } else {
      System.out.println("사진이 있당");
    }
    
    feed.setFeedPhotos(feedPhotoArray);
    feedService.add(feed);
    
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
    feedService.delete(feedNo);
    return "redirect:list";
  }

  @GetMapping("updateForm")
  public void updateForm(int feedNo, Model model) throws Exception {
    model.addAttribute("feed", feedService.get(feedNo));
  }

  @PostMapping("update")
  public String update( //
      int feedNo, //
      String title, //
      String content, //
      MultipartFile[] feedPhotos) throws Exception {
    
    System.out.println("1");
    
    Feed feed = feedService.get(feedNo);
    
    feed.setTitle(title);
    feed.setContent(content);
    
    if (feedPhotos == null)
      System.out.println("feedPhotos is null");
   
    ArrayList<FeedPhoto> feedPhotoArray = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/feed");
    for (MultipartFile feedPhoto : feedPhotos) {
      if (feedPhoto.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      feedPhoto.transferTo(new File(dirPath + "/" + filename));
      feedPhotoArray.add(new FeedPhoto().setFilepath(filename));
    }

    if (feedPhotoArray.size() > 0) {
      feed.setFeedPhotos(feedPhotoArray);
    } else {
      feed.setFeedPhotos(null);
    }

    feedService.update(feed);
    return "redirect:list";
  }
  
  
  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", feedService.search(keyword));
  }

}
