package com.nmnm.gms.service.impl;

import java.util.HashMap;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import com.nmnm.gms.dao.MemberDao;
import com.nmnm.gms.domain.GroupMember;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.domain.Message;
import com.nmnm.gms.service.MemberService;
import com.nmnm.gms.util.MailHandler;
import com.nmnm.gms.util.TempKey;

@Component
public class MemberServiceImpl implements MemberService {

  @Autowired
  private MemberDao memberDao;

  @Autowired
  private JavaMailSender mailSender;

  @Override
  public Member searchGrMember(int grMemberNo) throws Exception {
    return memberDao.findgrmember(grMemberNo);
  }

  @Override
  public int addGrMember(GroupMember grMember) throws Exception {
    return memberDao.insertGrMember(grMember);
  }

  @Override
  public int approvalGrMember(GroupMember grMember) throws Exception {
    return memberDao.approvalGrMember(grMember);
  }


  @Override
  public void join(Member member) throws Exception {
    memberDao.insert(member);
    String key = new TempKey().getKey(50, false); // 인증키 생성

    memberDao.createAuthKey(member.getEmail(), key); // 인증키 DB저장

    MailHandler sendMail = new MailHandler(mailSender);

    sendMail.setSubject("[네모내모 회원가입 서비스 이메일 인증 입니다.]");
    sendMail.setText(new StringBuffer().append("<h1>nemonaemo 가입 메일인증 입니다</h1>")
        .append("<a href='http://localhost:9999/nmnm/app/auth/emailConfirm?email=")
        .append(member.getEmail()).append("&key=").append(key)
        .append("' target='_blenk'>가입 완료를 위해 이메일 이곳을 눌러주세요</a>").toString());
    sendMail.setFrom("nemonaemo0@gmail.com", "nmnm");
    sendMail.setTo(member.getEmail());
    sendMail.send();
  }


  @Override
  public void userAuth(String email) throws Exception {
    memberDao.userAuth(email);
  }


  @Override
  public int update(Member member) throws Exception {
    return memberDao.update(member);
  }

  @Override
  public Member userView(String email) throws Exception {
    return memberDao.userView(email);
  }



  @Override
  public int findPassword(String name, String email) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("name", name);
    params.put("email", email);
    if (memberDao.findPassword(params) == 1) {
      String newPassword = new TempKey().getKey(8, false);
      params.put("newPassword", newPassword);
      memberDao.resetPassword(name, email, newPassword);
      MimeMessage mail = mailSender.createMimeMessage();
      String htmlStr = "<h2>해당 계정의 임시 비밀번호가 발급되었습니다.<br><br>" + "<h3>" + newPassword
          + "</h3><br><p><a href='http://localhost:9999/nmnm/app/auth/login'>nmnm 바로가기</a><br>(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
      try {
        mail.setSubject("[임시 비밀번호 발급] nmnm: 임시 비밀번호를 보내드립니다.", "utf-8");
        mail.setText(htmlStr, "utf-8", "html");
        mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));
        mailSender.send(mail);
      } catch (MessagingException e) {
        e.printStackTrace();
      }
    } else {
      System.out.println("일치하는 회원이 없습니다.");
    }
    return memberDao.findPassword(params);
  }

  @Override
  public void changePassword(Member member) throws Exception {
    memberDao.changePassword(member);
  }

  @Override
  public void drop(HttpSession session, String email) {}

  @Override
  public int send(Message message) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public Object sender(int no) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }


  @Override
  public void logout(HttpSession session) throws Exception {
    session.invalidate();
  }


  @Override
  public Member get(int no) throws Exception {
    return memberDao.findByNo(no);
  }


  @Override
  public Object list() {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Object search(String keyword) {
    // TODO Auto-generated method stub
    return null;
  }

  // 로그인
  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);
    return memberDao.findByEmailAndPassword(params);

  }



  @Override
  public Member naverLoginCheck(String email) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }


  // 네이버 로그인 시 기존 네이버 가입자의 이름과 별명을 가져오는 메서드
  @Override
  public Member getNameForNaverMember(String naverEmail) {
    return memberDao.getNameForNaverMember(naverEmail);
  }

  @Override
  public int emailCheck(String email) throws Exception {
    return memberDao.emailCheck(email);
  }

  @Override
  public void resetPassword(Member member) throws Exception {
    memberDao.resetPassword(member);
  }

  // 나라가 추가함 멤버닉네임 받아오려고
  @Override
  public Member findByNo(int no) throws Exception {
    return memberDao.findByNo(no);
  }


}


