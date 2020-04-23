<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>회원 입력(JSP)</h1>
<form action='add' method='post' enctype='multipart/form-data'>
이름: <input name='name' type='text'><br>
이메일: <input name='email' type='email'><br>
성별: <label><input name='gender' type='radio' value='남자'/>남자</label>
     <label><input name='gender' type='radio' value='여자'/>여자</label><br/>
생일: <input name='birthday' type='date'/><br>
닉네임: <input name='nickname' type='text'/><br/>
자기소개: <input name='intro' type='text'/><br/>
관심사: <label><input name='interest' type='radio' value='1'/>1</label>
      <label><input name='interest' type='radio' value='2'/>2</label><br/>
암호: <input name='password' type='password'><br>
사진: <input name='photoFile' type='file'><br>
전화: <input name='tel' type='tel'><br>
SNS: <input name='sns' type='text'><br/>
<input type='submit' value='upload'/><br>
<button>제출</button>
</form>

<jsp:include page="../footer.jsp"/>