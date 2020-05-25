<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>

    <!--이메일 인증을 하지 않은 회원 로그인 실패-->
    <script type="text/javascript">
    
        alert("이메일 인증 확인 후 로그인이 가능합니다.");
        window.open('', '_self', ''); // 브라우저창 닫기
        /* window.close(); // 브라우저 창 닫기 */
        self.location = '/nmnm/app/auth/login.jsp';
    </script>

</body>
</html>