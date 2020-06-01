package com.nmnm.gms.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nmnm.gms.domain.Plan;
import com.nmnm.gms.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  PlanService planService;

  static Logger logger = LogManager.getLogger(PlanController.class);

  public PlanController() {
    logger.debug("PlanController 생성됨!");
  }


  @PostMapping("form")
  public void form() {
    System.out.println("form 호출==================================================");
  }

  @GetMapping("calendar-data")
  @ResponseBody
  public String calendarData(int groupNo) throws Exception {
    logger.debug("calendar-data 호출==================================================");
    List<Plan> planList = planService.calendar(groupNo);
    ObjectMapper mapper = new ObjectMapper();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    mapper.setDateFormat(df);
    String jsonString = mapper.writeValueAsString(planList);
    System.out.println(jsonString);
    return jsonString;
  }

  @GetMapping("calendar")
  public void calendar(Model model, int groupNo) throws Exception {
    logger.debug("calendar 호출==================================================");
    model.addAttribute("planList", planService.calendar(groupNo));
  }

  @PostMapping("add")
  public String add(Plan plan, MultipartFile thumbnailFile) throws Exception {
    System.out.println("add 호출==================================================");
    System.out.println(thumbnailFile.getSize());
    if (thumbnailFile.getSize() > 0) {
      System.out.println("add/if");
      String dirPath = servletContext.getRealPath("/upload/plan");
      System.out.println("dirPath : " + dirPath);
      String filename = UUID.randomUUID().toString();
      System.out.println("filename : " + dirPath + "/" + filename);
      thumbnailFile.transferTo(new File(dirPath + "/" + filename));
      plan.setThumbnail(filename);
    }
    String[] startHour = plan.getStartDate().split("T");
    String[] endHour = plan.getEndDate().split("T");
    plan.setStartHour(startHour[1]);
    plan.setEndHour(endHour[1]);
    if (planService.add(plan) > 0) {
      return "redirect:list" + "?groupNo=" + plan.getGroupNo();
    } else {
      throw new Exception("일정을 추가할 수 없습니다.");
    }
  }

  @GetMapping("delete")
  public String delete(int planNo) throws Exception {
    if (planService.delete(planNo) > 0) { // 삭제했다면,
      return "redirect:list";
    } else {
      throw new Exception("삭제할 일정 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int planNo, Model model) throws Exception {
    model.addAttribute("plan", planService.get(planNo));
  }

  @GetMapping("list")
  public void list(Model model, int groupNo) throws Exception {
    System.out.println("list 호출==================================================");
    model.addAttribute("list", planService.list(groupNo));
    System.out.println("groupNo: " + groupNo);
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", planService.search(keyword));
  }

  @PostMapping("update")
  public String update(Plan plan, MultipartFile thumbnailFile) throws Exception {

    if (thumbnailFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/plan");
      String filename = UUID.randomUUID().toString();
      thumbnailFile.transferTo(new File(dirPath + "/" + filename));
      plan.setThumbnail(filename);
    }

    if (planService.update(plan) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 일정 번호가 유효하지 않습니다.");

    }
  }
}
