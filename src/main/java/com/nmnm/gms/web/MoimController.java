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
import com.nmnm.gms.service.GroupService;

@Controller
@RequestMapping("moim")
public class MoimController {

  static Logger logger = LogManager.getLogger(MoimController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  GroupService groupService;


  public MoimController() {
    logger.debug("MoimController 생성됨!");
  }
  
  
  @GetMapping("home")
  public void home(Model model, @RequestParam("groupNo")  int groupNo) throws Exception {
    model.addAttribute("group", groupService.get(groupNo));
  }


//  @GetMapping("form")
//  public void form() throws Exception {}
//
//
//  @PostMapping("add")
//  public String add( //
//      String title, //
//      String content, //
//      int groupNo, //
//      int memberNo, //
//      MultipartFile[] feedPhotos) throws Exception {
//
//    Feed feed = new Feed();
//
//    feed.setTitle(title);
//    feed.setContent(content);
//    feed.setGroupNo(groupNo);
//    feed.setMemberNo(memberNo);
//
//    ArrayList<FeedPhoto> feedPhotoArray = new ArrayList<>();
//    String dirPath = servletContext.getRealPath("/upload/feed");
//    System.out.println("1");
//    for (MultipartFile feedPhoto : feedPhotos) {
//      if (feedPhoto.getSize() <= 0) {
//        continue;
//      }
//      System.out.println("2");
//      String filename = UUID.randomUUID().toString();
//      System.out.println("3");
//      feedPhoto.transferTo(new File(dirPath + "/" + filename));
//      System.out.println("4");
//      feedPhotoArray.add(new FeedPhoto().setFilepath(filename));
//      System.out.println("5");
//    }
//
//    if (feedPhotoArray.size() == 0) {
//      throw new Exception("최소 한 개의 사진 파일을 등록해야 합니다.");
//    } else {
//      System.out.println("사진이 있당");
//    }
//
//    feed.setFeedPhotos(feedPhotoArray);
//    feedService.add(feed);
//
//    return "redirect:list";
//  }
//
//  @GetMapping("list")
//  public void list(Model model) throws Exception {
//    model.addAttribute("list", feedService.list());
//  }


//
//  @GetMapping("delete")
//  public String delete(int feedNo) throws Exception {
//    feedService.delete(feedNo);
//    return "redirect:list";
//  }
//
//  @GetMapping("updateForm")
//  public void updateForm(int feedNo, Model model) throws Exception {
//    model.addAttribute("feed", feedService.get(feedNo));
//  }
//
//  @PostMapping("update")
//  public String update( //
//      int feedNo, //
//      String title, //
//      String content, //
//      MultipartFile[] feedPhotos) throws Exception {
//
//    System.out.println("1");
//
//    Feed feed = feedService.get(feedNo);
//
//    feed.setTitle(title);
//    feed.setContent(content);
//
//    if (feedPhotos == null)
//      System.out.println("feedPhotos is null");
//
//    ArrayList<FeedPhoto> feedPhotoArray = new ArrayList<>();
//    String dirPath = servletContext.getRealPath("/upload/feed");
//    for (MultipartFile feedPhoto : feedPhotos) {
//      if (feedPhoto.getSize() <= 0) {
//        continue;
//      }
//      String filename = UUID.randomUUID().toString();
//      feedPhoto.transferTo(new File(dirPath + "/" + filename));
//      feedPhotoArray.add(new FeedPhoto().setFilepath(filename));
//    }
//
//    if (feedPhotoArray.size() > 0) {
//      feed.setFeedPhotos(feedPhotoArray);
//    } else {
//      feed.setFeedPhotos(null);
//    }
//
//    feedService.update(feed);
//    return "redirect:list";
//  }
//
//
//  @GetMapping("search")
//  public void search(String keyword, Model model) throws Exception {
//    model.addAttribute("list", feedService.search(keyword));
//  }
//
//
//  //
//  // 댓글 작성
//  @RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
//  public String replyWrite(FeedReply feedReply) throws Exception {
//
//    logger.info("reply Write");
//
//    feedReplyService.writeReply(feedReply);
//    System.out.println("피드리플라이 한개 추가요");
//
//    return "redirect:detail?feedNo=" + feedReply.getFeedNo();
//  }
//
//  // 댓글 수정
//  // 댓글 수정 GET
//  @RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
//  public void replyUpdateView(FeedReply feedReply, Model model) throws Exception {
//    logger.info("reply Update");
//
//    model.addAttribute("replyUpdate", feedReplyService.selectReply(feedReply.getFeedReplyNo()));
//
//  }
//
//  // 댓글 수정 POST
//  @RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
//  public String replyUpdate(FeedReply feedReply) throws Exception {
//    logger.info("reply Update");
//
//    feedReplyService.updateReply(feedReply);
//
//    return "redirect:detail?feedNo=" + feedReply.getFeedNo();
//  }
//
//
//  // 댓글 삭제
//  // 댓글 삭제 GET
//  @RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
//  public void replyDeleteView(FeedReply feedReply, Model model) throws Exception {
//    logger.info("reply Delete");
//
//    model.addAttribute("replyDelete", feedReplyService.selectReply(feedReply.getFeedReplyNo()));
//
//  }
//
//  // 댓글 삭제 POST
//  @RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
//  public String replyDelete(FeedReply feedReply) throws Exception {
//    logger.info("reply Delete");
//
//    feedReplyService.deleteReply(feedReply);
//
//    return "redirect:detail?feedNo=" + feedReply.getFeedNo();
//  }



}
