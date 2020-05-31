package com.nmnm.gms.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.nmnm.gms.domain.Feed;
import com.nmnm.gms.domain.FeedPhoto;
import com.nmnm.gms.domain.FeedReply;
import com.nmnm.gms.service.FeedReplyService;
import com.nmnm.gms.service.FeedService;

@Controller
@RequestMapping("feed")
public class FeedController {

  static Logger logger = LogManager.getLogger(FeedController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  FeedService feedService;
  
  @Autowired
  FeedReplyService feedReplyService;
  
  
  
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
    
    // 댓글 리스트 보기
    List<FeedReply> replyList = feedReplyService.readReply(feedNo);
    model.addAttribute("replyList", replyList);
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

  
  //
  //댓글 작성
  @RequestMapping(value="/replyWrite", method = RequestMethod.POST)
  public String replyWrite(FeedReply feedReply) throws Exception {
      
      logger.info("reply Write");
      
      feedReplyService.writeReply(feedReply);
      System.out.println("피드리플라이 한개 추가요");
      
      return "redirect:detail?feedNo=" + feedReply.getFeedNo();
  }
   
  //댓글 수정 
  //댓글 수정 GET
  @RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
  public void replyUpdateView(FeedReply feedReply, Model model) throws Exception {
      logger.info("reply Update");
      
      model.addAttribute("replyUpdate", feedReplyService.selectReply(feedReply.getFeedReplyNo()));
      
  }
  
  //댓글 수정 POST
  @RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
  public String replyUpdate(FeedReply feedReply) throws Exception {
      logger.info("reply Update");
      
      feedReplyService.updateReply(feedReply);
      
      return "redirect:detail?feedNo=" + feedReply.getFeedNo();
  }
  
  
  //댓글 삭제
  //댓글 삭제 GET
  @RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
  public void replyDeleteView(FeedReply feedReply, Model model) throws Exception {
      logger.info("reply Delete");
      
      model.addAttribute("replyDelete", feedReplyService.selectReply(feedReply.getFeedReplyNo()));

  }
  
  //댓글 삭제 POST
  @RequestMapping(value="/replyDelete", method = RequestMethod.POST)
  public String replyDelete(FeedReply feedReply) throws Exception {
      logger.info("reply Delete");
      
      feedReplyService.deleteReply(feedReply);
      
      return "redirect:detail?feedNo=" + feedReply.getFeedNo();
  }
  
  @ResponseBody
  @RequestMapping(value="/liketo/like.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
  public String like(int boardno, HttpSession session){
    //System.out.println("--> like() created");
    int mno = (Integer)session.getAttribute("mno");
    JSONObject obj = new JSONObject();
 
    ArrayList<String> msgs = new ArrayList<String>();
    HashMap <String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("boardno", boardno);
    hashMap.put("mno", mno);
    LiketoVO liketoVO = liketoProc.read(hashMap);
    
    BoardVO boardVO = boardProc.read(boardno);
    int like_cnt = boardVO.getLike_cnt();     //게시판의 좋아요 카운트
    int like_check = 0;
    like_check = liketoVO.getLike_check();    //좋아요 체크 값
    
    if(liketoProc.countbyLike(hashMap)==0){
      liketoProc.create(hashMap);
    }
      
    if(like_check == 0) {
      msgs.add("좋아요!");
      liketoProc.like_check(hashMap);
      like_check++;
      like_cnt++;
      boardProc.like_cnt_up(boardno);   //좋아요 갯수 증가
    } else {
      msgs.add("좋아요 취소");
      liketoProc.like_check_cancel(hashMap);
      like_check--;
      like_cnt--
      boardProc.like_cnt_down(boardno);   //좋아요 갯수 감소
    }
    obj.put("boardno", liketoVO.getBoardno());
    obj.put("like_check", like_check);
    obj.put("like_cnt", like_cnt);
    obj.put("msg", msgs);
    
    return obj.toJSONString();
  }


}
