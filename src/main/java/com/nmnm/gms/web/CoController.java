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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.nmnm.gms.Pagination;
import com.nmnm.gms.domain.Co;
import com.nmnm.gms.domain.CoReply;
import com.nmnm.gms.service.CoReplyService;
import com.nmnm.gms.service.CoService;


@Controller
@RequestMapping("/co")
public class CoController {

  static Logger logger = LogManager.getLogger(CoController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  CoService coService;
  
  @Autowired
  CoReplyService coReplyService;
  

  public CoController() {
    logger.debug("CoController 생성됨!");
  }

  
  @GetMapping("form")
  public void form() throws Exception {}

  @PostMapping("add")
  public String add(Co co) throws Exception {
    
    coService.add(co);
    
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int coNo) throws Exception {
    coService.delete(coNo);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(Model model, @RequestParam("coNo")int coNo) throws Exception {
    model.addAttribute("co", coService.get(coNo));
    
    // 댓글 리스트 보기
    List<CoReply> replyList = coReplyService.readReply(coNo);
    model.addAttribute("replyList", replyList);
    
    // 게시물 조회수 +1
    coService.plusCnt(coNo);
  }

  // @GetMapping("list")
  // public void list(Model model) throws Exception {
  // model.addAttribute("list", coService.list(););
  // }

  @GetMapping("list")
  public void list(Model model, @RequestParam(required = false, defaultValue = "1") int page,
      @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
    // 전체 게시글 갯수
    int listCnt = coService.listCnt();

    // Pagination 객체생성
    Pagination pagination = new Pagination();
    pagination.pageInfo(page, range, listCnt);
    model.addAttribute("pagination", pagination);
    model.addAttribute("list", coService.list(pagination));
  }

  @GetMapping("updateForm")
  public void updateForm(int coNo, Model model) throws Exception {
    model.addAttribute("co", coService.get(coNo));
  }

  @PostMapping("update")
  public String update(Co co) throws Exception {
    
    coService.update(co);
    return "redirect:list";
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", coService.search(keyword));
  }

  @GetMapping("categorySearch")
  public void categorySearch(@RequestParam String keyword2, Model model) throws Exception {
    model.addAttribute("list", coService.categorySearch(keyword2));
    model.addAttribute("keyword2", keyword2);
  }
  
  //
  //댓글 작성
  @RequestMapping(value="/replyWrite", method = RequestMethod.POST)
  public String replyWrite(CoReply coReply) throws Exception {
      
      logger.info("reply Write");
      
      coReplyService.writeReply(coReply);
      System.out.println("리플라이 한개 추가요");
      
      return "redirect:detail?coNo=" + coReply.getCoNo();
  }
   
  //댓글 수정 
  //댓글 수정 GET
  @RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
  public void replyUpdateView(CoReply coReply, Model model) throws Exception {
      logger.info("reply Update");
      
      model.addAttribute("replyUpdate", coReplyService.selectReply(coReply.getCoReplyNo()));
      
  }
  
  //댓글 수정 POST
  @RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
  public String replyUpdate(CoReply coReply) throws Exception {
      logger.info("reply Update");
      
      coReplyService.updateReply(coReply);
      
      return "redirect:detail?coNo=" + coReply.getCoNo();
  }
  
  
  //댓글 삭제
  //댓글 삭제 GET
  @RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
  public void replyDeleteView(CoReply coReply, Model model) throws Exception {
      logger.info("reply Delete");
      
      model.addAttribute("replyDelete", coReplyService.selectReply(coReply.getCoReplyNo()));

  }
  
  //댓글 삭제 POST
  @RequestMapping(value="/replyDelete", method = RequestMethod.POST)
  public String replyDelete(CoReply coReply) throws Exception {
      logger.info("reply Delete");
      
      coReplyService.deleteReply(coReply);
      
      return "redirect:detail?coNo=" + coReply.getCoNo();
  }
  
    
}