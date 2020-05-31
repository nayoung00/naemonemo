package com.nmnm.gms.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.nmnm.gms.domain.Member;
import com.nmnm.gms.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AuthController {
  private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

  @Autowired
  MemberService memberService;


  @Autowired
  BCryptPasswordEncoder passEncoder;

  // 회원 가입 get
  @RequestMapping(value = "join", method = RequestMethod.GET)
  public void getJoin(Member member) throws Exception {

    logger.info("get join");
  }

  // 회원 가입 post
  @RequestMapping(value = "join", method = RequestMethod.POST)
  public String postJoin(Member member, Model model, RedirectAttributes rttr,
      HttpServletRequest request, HttpSession session) throws Exception {
    logger.info("post join");
    logger.info("회원가입...");

    String email = request.getParameter("email"); // 회원가입 폼에서 넘어오는 데이터들을 받아서 변수에 담음
    memberService.join(member);


    rttr.addFlashAttribute("authmsg", "가입시 사용한 이메일로 인증해주세요");
    return "redirect:/";
  }

  @ResponseBody
  @RequestMapping(value = "emailCheck", method = RequestMethod.POST)
  public int emailCheck(String email) throws Exception {
    System.out.println(email);
    int count = memberService.emailCheck(email);
    System.out.println(count);
    return count;
  }


  // 회원이 이메일 인증 클릭시 리턴받는 정보
  @GetMapping("/emailConfirm")
  public String emailConfirm(String email, Model model) throws Exception {

    memberService.userAuth(email);
    model.addAttribute("name", email);

    // view 아래에 emailConfirm.jsp로 이동
    return "auth/emailConfirm";
  }



  @GetMapping("login")
  public void login() {}

  @PostMapping("login")
  public String login(String email, String password, String saveEmail, HttpServletResponse response,
      HttpSession session, Model model) throws Exception {
    Cookie cookie = new Cookie("email", email);
    if (saveEmail != null) {
      cookie.setMaxAge(60 * 60 * 24 * 30);
    } else {
      cookie.setMaxAge(0);
    }
    response.addCookie(cookie);

    Member member = memberService.get(email, password);
    System.out.println(member);
    if (member != null) {
      if (member.getAuthStatus().equals("N")) {
        return "redirect:emailAgainFail";
      }
      session.setAttribute("loginUser", member);
      model.addAttribute("refreshUrl", "2;url=../../index.html");
    } else {
      session.invalidate();
      model.addAttribute("refreshUrl", "2;url=login");
    }
    return "auth/loginForm";
  }


  @GetMapping("emailAgainFail")
  public void emailFail() {}

  @GetMapping("logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:../../index.html";
  }

  @GetMapping("callback")
  public void callback() {}

  @PostMapping("resetPassword")
  public void resetPassword() {}


  @GetMapping("findPassword")
  public void findPasswordForm() {}

  @PostMapping("findPassword")
  public String findPassword(String name, String email, Model model) throws Exception {
    System.out.println("비밀번호를 찾아줘!");
    int user = memberService.findPassword(name, email);
    if (user == 1) {
      model.addAttribute("email", email);
      return "redirect:/";
    } else {
      throw new Exception("일치하는 회원이 없습니다.");
    }
  }

  // 메일로 리턴받은 정보를 가지고 패스워드 변경 페이지로 세션에 이메일을담아 보냄
  @RequestMapping(value = "returnResetPass", method = {RequestMethod.GET, RequestMethod.POST})
  public String postRetrunResetPass(HttpSession session, HttpServletRequest request, Model model)
      throws Exception {

    String email = request.getParameter("email");

    session.setAttribute("email", email);

    return "redirect:/auth/pwResetChange.jsp";

  }

  @SuppressWarnings("deprecation")
  @GetMapping("naverLogin")
  public String naverLogin(HttpServletRequest request, HttpServletResponse response, Model model,
      HttpSession session) throws Exception {

    String clientId = "gpaO5pkwAnLvkrjATqmF";// 애플리케이션 클라이언트 아이디값";
    String clientSecret = "N8aXnTFQg8";// 애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI =
        URLEncoder.encode("http://localhost:9999/nmnm/app/auth/naverLogin", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    logger.info("apiURL=" + apiURL);

    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      logger.info("responseCode=" + responseCode);
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else { // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if (responseCode == 200) {
        System.out.println(res.toString());
        // json인 access_token을 String 형식으로 받아오기.
        JsonParser parsing = new JsonParser();
        JsonElement jsonElement = parsing.parse(res.toString());

        access_token = jsonElement.getAsJsonObject().get("access_token").toString();
        refresh_token = jsonElement.getAsJsonObject().get("refresh_token").toString();

        if (access_token != null) { // access_token을 받아왔다면
          try {

            System.out.println(access_token);
            String token = access_token; // 네이버 로그인 접근 토큰;
            String header = "Bearer " + token; // Bearer 다음에 공백 추가

            logger.info(header);
            String apiURL2 = "https://openapi.naver.com/v1/nid/me";

            Map<String, String> requestHeaders = new HashMap<>();
            requestHeaders.put("Authorization", header);
            String responseBody = get(apiURL2, requestHeaders);

            logger.info(responseBody);

            String naverRes;
            JsonParser naverResponse = new JsonParser();
            JsonElement nrJsonElement = naverResponse.parse(responseBody.toString());
            naverRes = nrJsonElement.getAsJsonObject().get("response").toString();

            logger.info(naverRes);

            // 이메일 값 가져오기....
            String email;
            JsonParser naverJson = new JsonParser();
            JsonElement naverJsonElement = naverJson.parse(naverRes.toString());
            email = naverJsonElement.getAsJsonObject().get("email").toString();

            // int idx = email.indexOf("@");
            // String mail1 = email.substring(1, idx);
            // logger.info(mail1);
            // String mail2 = email.substring(idx, 30);
            // logger.info(mail2);
            // email = mail1 + mail2;

            Member member = memberService.userView(email);


            if (member == null) {
              // 현재 서버에 등록되지 않았다면, 새 사용자로 자동 등록한다.
              member = new Member();
              member.setEmail(email);
              member.setName(clientId);
              member.setPassword(UUID.randomUUID().toString());
              Date cntDateNaver = new Date(System.currentTimeMillis());
              member.setCreateDate(cntDateNaver);
              member.setAuthStatus("Y");
              memberService.join(member);
              session.setAttribute("loginUser", member);
            } else {
              member.setAuthStatus("Y");
              session.setAttribute("loginUser", member);
            }

            model.addAttribute("refreshUrl", "2;url=form");
            return "redirect:../../index.html";

          } catch (Exception e) {
            e.printStackTrace();
          }
        }
      }
    } catch (Exception e) {
      System.out.println(e);
    }
    return "redirect:../../index.html";
  }

  private String get(String apiURL2, Map<String, String> requestHeaders) {
    HttpURLConnection con = connect(apiURL2);
    try {
      con.setRequestMethod("GET");
      for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
        con.setRequestProperty(header.getKey(), header.getValue());
      }

      int responseCode = con.getResponseCode();
      if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
        return readBody(con.getInputStream());
      } else { // 에러 발생
        return readBody(con.getErrorStream());
      }
    } catch (IOException e) {
      throw new RuntimeException("API 요청과 응답 실패", e);
    } finally {
      con.disconnect();
    }
  }

  private String readBody(InputStream inputStream) {
    InputStreamReader streamReader = new InputStreamReader(inputStream);

    try (BufferedReader lineReader = new BufferedReader(streamReader)) {
      StringBuilder responseBody = new StringBuilder();

      String line;
      while ((line = lineReader.readLine()) != null) {
        responseBody.append(line);
      }

      return responseBody.toString();
    } catch (IOException e) {
      throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
    }
  }

  private HttpURLConnection connect(String apiURL2) {
    try {
      URL url = new URL(apiURL2);
      return (HttpURLConnection) url.openConnection();
    } catch (MalformedURLException e) {
      throw new RuntimeException("API URL이 잘못되었습니다. : " + apiURL2, e);
    } catch (IOException e) {
      throw new RuntimeException("연결이 실패했습니다. : " + apiURL2, e);
    }
  }



}
