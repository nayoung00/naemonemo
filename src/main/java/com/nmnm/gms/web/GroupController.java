package com.nmnm.gms.web;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.nmnm.gms.domain.Group;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.interceptor.Auth;
import com.nmnm.gms.interceptor.Auth.Role;
import com.nmnm.gms.service.GroupService;

@Auth(role = Role.MEMBER)
@Controller
@RequestMapping("/group")
public class GroupController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  GroupService groupService;

  @GetMapping("updateForm")
  public void updateForm(int groupNo, Model model) throws Exception {
    model.addAttribute("group", groupService.get(groupNo));
  }

  @GetMapping("form")
  public void form() {}



  @PostMapping("add")
  public String add( //
      String groupName, //
      String groupInfo, //
      String groupForm, //
      String groupInterest,
      String city,
      MultipartFile photoFile) throws Exception {
    
    Group group = new Group();
    
    group.setGroupName(groupName);
    group.setGroupInfo(groupInfo);
    group.setGroupForm(groupForm);
    group.setGroupInterest(groupInterest);
    group.setCity(city);
    
    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/group");
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      group.setGroupPhoto(filename);
    }

    groupService.add(group);
    System.out.println("group 추가가 되었다.");
    
        return "redirect:http://localhost:9999/nmnm/app/moim/home?groupNo="+ group.getGroupNo(); // 모임 홈으로 가게
  }

  @GetMapping("delete")
  public String delete(int groupNo) throws Exception {
    if (groupService.delete(groupNo) > 0) { // 삭제했다면,
      return "redirect:list";
    } else {
      throw new Exception("삭제할 그룹 번호가 유효하지 않습니다.");
    }
  }

  @GetMapping("detail")
  public void detail(int groupNo, Model model) throws Exception {
    model.addAttribute("group", groupService.get(groupNo));
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

  // 멤버가 가입한 모임 리스트 - httpSession으로 memberInfo에 memberNo담아서 받아옴 
  @GetMapping("listByJoin")
  public void listByJoin(Model model, HttpSession httpSession) throws Exception {
    
    Member memberInfo = (Member) httpSession.getAttribute("memberInfo");
    model.addAttribute("listByJoin", groupService.listByJoin(memberInfo.getMemberNo()));
  }

  // 추천 모임 리스트 - httpSession으로 memberInfo에 interest담아서 받아옴
  @GetMapping("listByRec")
  public void listByRec(Model model, HttpSession httpSession) throws Exception {
    
    Member memberInfo = (Member) httpSession.getAttribute("memberInfo");
    
    System.out.println("listByRec :: Test");
    System.out.println("interest :: " + memberInfo.getInterest());
    List<Group> list = groupService.listByRec(memberInfo.getInterest());
    for(Group g : list) {
      System.out.println(g);
    }
    model.addAttribute("listByRec", list);
  }

  // 신규 모임 리스트
  @GetMapping("listByCd")
  public void listByCd(Model model) throws Exception {
    model.addAttribute("listByCd", groupService.listByCd());
  }

}
