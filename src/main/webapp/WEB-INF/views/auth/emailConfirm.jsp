<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

    <script type="text/javascript">
    
        var email = '${email}';
        alert(email + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다.');
        window.open('', '_self', ''); // 브라우저창 닫기
        /* window.close(); // 브라우저 창 닫기 */
        self.location = '/nmnm/app/auth/login.jsp';
    </script>

</body>
