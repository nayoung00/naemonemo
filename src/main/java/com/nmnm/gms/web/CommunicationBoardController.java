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
import com.nmnm.gms.Criteria;
import com.nmnm.gms.domain.CommunicationBoard;
import com.nmnm.gms.service.CommunicationBoardService;

@Controller
@RequestMapping("/communicationBoard")
public class CommunicationBoardController {

  static Logger logger = LogManager.getLogger(CommunicationBoardController.class);

  @Autowired
  CommunicationBoardService communicationBoardService;

  public CommunicationBoardController() {
    logger.debug("CommunicationBoardController 생성됨!");
  }

  @GetMapping("form")
  public void form() throws Exception {}

  @PostMapping("add")
  public String add(CommunicationBoard communicationBoard) throws Exception {
    communicationBoardService.add(communicationBoard);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int communicationBoardNo) throws Exception {
    if (communicationBoardService.delete(communicationBoardNo) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 게시물 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int communicationBoardNo, Model model) throws Exception {
    CommunicationBoard communicationBoard = communicationBoardService.get(communicationBoardNo);
    model.addAttribute("communicationBoard", communicationBoard);
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<CommunicationBoard> communicationBoards = communicationBoardService.list();
    model.addAttribute("list", communicationBoards);
  }

  @GetMapping("updateForm")
  public void updateForm(int communicationBoardNo, Model model) throws Exception {
    model.addAttribute("communicationBoard", communicationBoardService.get(communicationBoardNo));
  }

  @PostMapping("update")
  public String update(CommunicationBoard communicationBoard) throws Exception {
    if (communicationBoardService.update(communicationBoard) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 게시물 번호가 유효하지 않습니다." + communicationBoard.getCommunicationBoardNo()
          + " " + communicationBoard.getTitle());
    }
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", communicationBoardService.search(keyword));
  }

  @GetMapping("categorySearch")
  public void categorySearch(String keyword2, Model model) throws Exception {
    model.addAttribute("list", communicationBoardService.categorySearch(keyword2));
  }

  @GetMapping("/communicationBoard") // 게시판 호출(게시판글 리스트와 페이징정보)
  public void getCommunicationBoardPage(Criteria cri, Model model) {

  }

}
