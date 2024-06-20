<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--jsp 파일에서 자바 클래스를 import 하여 사용--%>
<%@ page import="bitc.fullstack405.study03.util.CookieManager" %>

<%
  // CookieManager의 메소드가 모두 정적메소드이므로 클래스명으로 직접 사용함
//  처음 접속 시 쿠키정보가 없으므로 변수 loginId에 빈 문자열이 저장됨
  String loginId = CookieManager.readCookie(request, "loginId");

  String cookieCheck = "";

  if (!loginId.equals("")) {
    cookieCheck = "checked";
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
  <h2>로그인 페이지</h2>
  <form action="IdSaveProcess.jsp" method="POST">
    아이디 : <input type="text" name="userId" value="<%=loginId%>">
    <input type="checkbox" name="saveCheck" value="Y" <%=cookieCheck%> >
    <br>
    패스워드 : <input type="password" name="userPw">
    <br>
    <button type="submit" class="btn btn-primary">로그인하기</button>
  </form>
</div>
</body>
</html>











