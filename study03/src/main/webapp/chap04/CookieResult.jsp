<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

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
  <h2>쿠키값 확인하기 (쿠키가 생성된 이후의 페이지)</h2>
  <%
    // 서버로 두번째 요청을 하였기 때문에 request 객체에 쿠키가 포함되어 있음
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        String cookieName = cookie.getName();
        String cookieValue = cookie.getValue();
//        쿠키 생성 시 URLEncoder를 사용하였기 때문에 URLDecoder로 풀어줌
        cookieValue = URLDecoder.decode(cookieValue, "UTF-8");
        out.println(cookieName + " : " + cookieValue + "<br>");
      }
    }
  %>
</div>
</body>
</html>











