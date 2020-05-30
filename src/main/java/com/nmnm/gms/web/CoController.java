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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.nmnm.gms.Pagination;
import com.nmnm.gms.domain.Co;
import com.nmnm.gms.domain.CoPhoto;
import com.nmnm.gms.service.CoService;

@Controller
@RequestMapping("/co")
public class CoController {

  static Logger logger = LogManager.getLogger(CoController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  CoService coService;

  public CoController() {
    logger.debug("CoController 생성됨!");
  }

  @GetMapping("form")
  public void form() throws Exception {}

  @PostMapping("add")
  public String add( //
      String category, //
      int memberNo, //
      String title, //
      String content, //
      MultipartFile[] coPhotos) throws Exception {
    
    Co co = new Co();
    
    co.setCategory(category);
    co.setMemberNo(memberNo);
    co.setTitle(title);
    co.setContent(content);
    
    ArrayList<CoPhoto> coPhotoArray = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/co");
    for (MultipartFile coPhoto : coPhotos) {
      if (coPhoto.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      coPhoto.transferTo(new File(dirPath + "/" + filename));
      coPhotoArray.add(new CoPhoto().setFilepath(filename));
    }
    
    if (coPhotoArray.size() == 0) {
      throw new Exception("최소 한 개의 사진 파일을 등록해야 합니다.");
    } else {
      System.out.println("사진이 있당");
    }
    
    co.setCoPhotos(coPhotoArray);
    coService.add(co);
    
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int coNo) throws Exception {
    coService.delete(coNo);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(int coNo, Model model) throws Exception {
    model.addAttribute("co", coService.get(coNo));
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
  public String update( //
      int coNo, //
      String category, //
      int memberNo, //
      String title, //
      String content, //
      MultipartFile[] coPhotos) throws Exception {
    
    Co co = coService.get(coNo);
    
    co.setCategory(category);
    co.setTitle(title);
    co.setContent(content);
    
    ArrayList<CoPhoto> coPhotoArray = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/co");
    for (MultipartFile coPhoto : coPhotos) {
      if (coPhoto.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      coPhoto.transferTo(new File(dirPath + "/" + filename));
      coPhotoArray.add(new CoPhoto().setFilepath(filename));
    }

    if (coPhotoArray.size() > 0) {
      co.setCoPhotos(coPhotoArray);
    } else {
      co.setCoPhotos(null);
    }

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
}
