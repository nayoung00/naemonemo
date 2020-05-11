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
import com.nmnm.gms.domain.Co;
import com.nmnm.gms.service.CoService;

@Controller
@RequestMapping("/co")
public class CoController {

  static Logger logger = LogManager.getLogger(CoController.class);

  @Autowired
  CoService coService;

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
    if (coService.delete(coNo) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 게시물 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int coNo, Model model) throws Exception {
    Co co = coService.get(coNo);
    model.addAttribute("co", co);
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Co> cos = coService.list();
    model.addAttribute("list", cos);
  }

  @GetMapping("updateForm")
  public void updateForm(int coNo, Model model) throws Exception {
    model.addAttribute("co", coService.get(coNo));
  }

  @PostMapping("update")
  public String update(Co co) throws Exception {
    if (coService.update(co) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 게시물 번호가 유효하지 않습니다." + co.getCoNo()
          + " " + co.getTitle());
    }
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", coService.search(keyword));
  }

  @GetMapping("categorySearch")
  public void categorySearch(String keyword2, Model model) throws Exception {
    model.addAttribute("list", coService.categorySearch(keyword2));
  }

  @GetMapping("/co") // 게시판 호출(게시판글 리스트와 페이징정보)
  public void getCommunicationBoardPage(Criteria cri, Model model) {

  }

}
