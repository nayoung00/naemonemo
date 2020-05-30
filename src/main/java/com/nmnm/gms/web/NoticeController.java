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
import org.springframework.web.multipart.MultipartFile;
import com.nmnm.gms.domain.Notice;
import com.nmnm.gms.domain.NoticePhoto;
import com.nmnm.gms.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

  static Logger logger = LogManager.getLogger(NoticeController.class);
 
  @Autowired
  ServletContext servletContext;
  
  @Autowired
  NoticeService noticeService;

  public NoticeController() {
    logger.debug("NoticeController 생성됨!");
  }
  
  @GetMapping("form")
  public void form() throws Exception {}


  @PostMapping("add")
  public String add( //
      String title, //
      String content, //
      int groupNo, //
      int memberNo, //
      MultipartFile[] noticePhotos) throws Exception {

    Notice notice = new Notice();
    
    notice.setTitle(title);
    notice.setContent(content);
    notice.setGroupNo(groupNo);
    notice.setMemberNo(memberNo);
    
    ArrayList<NoticePhoto> noticePhotoArray = new ArrayList<>();
    String dirPath = servletContext.getRealPath("upload/notice");
    
    for (MultipartFile noticePhoto : noticePhotos) {
      if (noticePhoto.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      noticePhoto.transferTo(new File(dirPath + "/" + filename));
      noticePhotoArray.add(new NoticePhoto().setFilepath(filename));
    }
    
    if (noticePhotoArray.size() == 0) {
      throw new Exception("최소 한 개의 사진 파일을 등록해야 합니다.");
    } else {
      System.out.println("사진이 있당");      
    }
    
    notice.setNoticePhotos(noticePhotoArray);
    noticeService.add(notice);
    
    return "redirect:list";
  }
  
  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", noticeService.list());
  }

  @GetMapping("detail")
  public void detail(int noticeNo, Model model) throws Exception {
    model.addAttribute("notice", noticeService.get(noticeNo));
  }

  @GetMapping("delete")
  public String delete(int noticeNo) throws Exception {
    noticeService.delete(noticeNo);
    return "redirect:list";
  }

  @GetMapping("updateForm")
  public void updateForm(int noticeNo, Model model) throws Exception {
    model.addAttribute("notice", noticeService.get(noticeNo));
  }

  @PostMapping("update")
  public String update( //
      int noticeNo, //
      String title, //
      String content, //
      int groupNo, //
      int memberNo, //
      MultipartFile[] noticePhotos) throws Exception {
    
    Notice notice = noticeService.get(noticeNo);
    
    notice.setTitle(title);
    notice.setContent(content);
    
    ArrayList<NoticePhoto> noticePhotoArray = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/notice");   
    for (MultipartFile noticePhoto : noticePhotos) {
      if(noticePhoto.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      noticePhoto.transferTo(new File(dirPath + "/" + filename));
      noticePhotoArray.add(new NoticePhoto().setFilepath(filename));
    }
    
    if (noticePhotoArray.size() > 0) {
      notice.setNoticePhotos(noticePhotoArray);
    } else {
      notice.setNoticePhotos(null);
    }
    
    noticeService.update(notice);
    return "redirect:list";
  }
  
  
    @GetMapping("search")
    public void search(String keyword, Model model) throws Exception {
      model.addAttribute("list", noticeService.search(keyword));
    }
  
}
