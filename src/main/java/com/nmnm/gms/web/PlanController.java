package com.nmnm.gms.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nmnm.gms.domain.Plan;
import com.nmnm.gms.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {


  @Autowired
  PlanService planService;

  @GetMapping("form")
  public void form() {}

  @PostMapping("add")
  public String add(Plan plan) throws Exception {
    if (planService.add(plan) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("일정을 추가할 수 없습니다.");
    }
  }

  @GetMapping("delete")
  public String delete(int planBoardNo) throws Exception {
    if (planService.delete(planBoardNo) > 0) { // 삭제했다면,
      return "redirect:list";
    } else {
      throw new Exception("삭제할 일정 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int planBoardNo, Model model) throws Exception {
    model.addAttribute("plan", planService.get(planBoardNo));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", planService.list());
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", planService.search(keyword));
  }

  @PostMapping("update")
  public String update(Plan plan) throws Exception {
    if (planService.update(plan) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 일정 번호가 유효하지 않습니다." + plan.getPlanBoardNo() + " " + plan.getTitle());

    }
  }

}
