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
import com.nmnm.gms.domain.Group;
import com.nmnm.gms.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  GroupService groupService;

  @GetMapping("updateForm")
  public void updateForm(int no, Model model) throws Exception {
    model.addAttribute("group", groupService.get(no));
  }

  @GetMapping("form")
  public void form() {}

  @GetMapping("register")
  public void register() {}

  @PostMapping("add")
  public String add( //
      Group group, //
      MultipartFile photoFile) throws Exception {
    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/group");
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      group.setGroupPhoto(filename);
    }

    if (groupService.add(group) > 0) {
      return "redirect:list"; // 모임 홈으로 가게
    } else {
      throw new Exception("그룹을 추가할 수 없습니다.");
    }
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    if (groupService.delete(no) > 0) { // 삭제했다면,
      return "redirect:list";
    } else {
      throw new Exception("삭제할 그룹 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("group", groupService.get(no));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", groupService.list());
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", groupService.search(keyword));
  }

  @PostMapping("update")
  public String update( //
      Group group, //
      MultipartFile photoFile) throws Exception {

    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/group");
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      group.setGroupPhoto(filename);
    }

    if (groupService.update(group) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 그룹 번호가 유효하지 않습니다.");
    }
  }
}
