package com.nmnm.gms.service.impl;

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
  public Member emailCheck(String email) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public void join(Member member) throws Exception {
    memberDao.insert(member);
    String key = new TempKey().getKey(50, false); // 인증키 생성

    memberDao.createAuthKey(member.getEmail(), key); // 인증키 DB저장

    MailHandler sendMail = new MailHandler(mailSender);

    sendMail.setSubject("[네모내모 회원가입 서비스 이메일 인증 입니다.]");
    sendMail.setText(new StringBuffer().append("<h1>nemonaemo 가입 메일인증 입니다</h1>")
        .append("<a href='http://localhost:8080/nmnm/app/auth/emailConfirm?email=")
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
  public void emailAgainSend(Member member) throws Exception {
    String key = new TempKey().getKey(50, false); // 인증키 생성

    memberDao.createAuthKey(member.getEmail(), key); // 인증키 DB저장

    MailHandler sendMail = new MailHandler(mailSender);

    sendMail.setSubject("[네모내모 회원가입 서비스 이메일 인증 입니다.]");
    sendMail.setText(new StringBuffer().append("<h1>nemonaemo 가입 메일인증 입니다</h1>")
        .append("<a href='http://localhost:8080/nmnm/auth/emailConfirm?email=")
        .append(member.getEmail()).append("&key=").append(key)
        .append("' target='_blenk'>가입 완료를 위해 이메일 이곳을 눌러주세요</a>").toString());
    sendMail.setFrom("nemonaemo0@gmail.com", "nmnm");
    sendMail.setTo(member.getEmail());
    sendMail.send();

  }

  @Override
  public void update(Member member, HttpSession session) throws Exception {
    memberDao.update(member);
  }

  @Override
  public Member userView(String email) throws Exception {
    return memberDao.userView(email);
  }

  @Override
  public void resetPassword(Member member) throws Exception {
    MailHandler sendMail = new MailHandler(mailSender);

    String link = "http://localhost:8080/nmnm/app/auth/returnResetPass?email=" + member.getEmail();

    sendMail.setSubject("[네모내모 비밀번호 초기화 이메일 입니다.]");
    sendMail.setText(
        "<br><table class=\"main\" style=\"border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;background:#ffffff;border-radius:0 !important;border-left-width:0 !important;border-right-width:0 !important;\">\n"
            + "<!-- START MAIN CONTENT AREA --><tr>\n"
            + "<td class=\"wrapper\" style=\"font-family:sans-serif;font-size:16px !important;vertical-align:top;padding:10px !important;box-sizing:border-box;\">\n"
            + " \n" + " \n"
            + "                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate;\n"
            + "        mso-table-lspace: 0pt;\n" + "        mso-table-rspace: 0pt;\n"
            + "        width: 100%;\"><tr>\n"
            + "<td style=\"font-family:sans-serif;font-size:16px !important;vertical-align:top;padding:10px!important;\">\n"
            + "                        <h1 style=\"color:#000000;font-family:sans-serif;font-weight:700;line-height:1.4;margin-top:15px;margin-bottom:10px !important;border-bottom:1px solid #000;padding-bottom:15px;font-size:28px !important;text-transform:capitalize;\">비밀번호 초기화</h1>\n"
            + "                        <p style=\"font-family:sans-serif;font-size:16px !important;font-weight:normal;margin:0;margin-bottom:15px;\">"
            + member.getName() + "님 비밀번호를 잊으셨나요?<br> 아래 링크를 누르신 후 새 비밀번호를 설정해주시기 바랍니다.</p>\n"
            + "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100%;box-sizing:border-box;\"><tbody><tr>\n"
            + "<td align=\"left\" style=\"font-family:sans-serif;font-size:16px !important;vertical-align:top;padding:10px!important;padding-left:0!important;padding-right:0!important;padding-bottom:15px;\">\n"
            + "                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:separate;mso-table-lspace:0pt;mso-table-rspace:0pt;width:100% !important;\"><tbody><tr>\n"
            + "<td style=\"font-family:sans-serif;font-size:16px !important;vertical-align:top;padding:10px!important;background-color:#1FCBC7;border-radius:5px;text-align:center;padding-left:0!important;padding-right:0!important;\"> <a href=\""
            + link
            + "\" target=\"_blank\" style=\"color:#ffffff;text-decoration:none;font-size:20px;background-color:#1FCBC7;border:solid 1px #1FCBC7;border-radius:5px;box-sizing:border-box;cursor:pointer;display:inline-block;font-weight:bold;margin:0;padding:3px 25px;text-transform:capitalize;border-color:#1FCBC7;width:100% !important;\">비밀번호 초기화</a> </td>\n"
            + "                                    </tr></tbody></table>\n" + "</td>\n"
            + "                            </tr></tbody></table>\n"
            + "<br>본 메일을 요청하지 않으셨다면 고객센터로 연락바랍니다.\n" + "                      </p>\n" + "</td>\n"
            + "                    </tr></table>\n</table>\n");

    sendMail.setFrom("nemonaemo0@gmail.com", "네모내모");
    sendMail.setTo(member.getEmail());
    sendMail.send();

    memberDao.resetPassword(member);

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
  public Member login(Member member) throws Exception {
    return memberDao.login(member);
  }

  @Override
  public void logout(HttpSession session) throws Exception {
    session.invalidate();
  }

  @Override
  public int update(Member member) throws Exception {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public Object get(int no) {
    // TODO Auto-generated method stub
    return null;
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

  @Override
  public Member get(String email, String password) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Member findAccount(String email) throws Exception {
    return memberDao.findAccount(email);
  }

  @Override
  public Member naverLoginCheck(String email) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Member kakaoLoginCheck(String usermId) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  // 네이버 로그인 시 기존 네이버 가입자의 이름과 별명을 가져오는 메서드
  @Override
  public Member getNameForNaverMember(String naverEmail) {
    return memberDao.getNameForNaverMember(naverEmail);
  }

}
