<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오전 11:25
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
  <h2>1. 쿠키(Cookie) 설정</h2>
  <%
    // 쿠키 생성하기
//    쿠키의 이름은 Cookie 클래스 타입의 생성자를 통해서만 가능
//    쿠키에 한글을 저장 시 오류가 발생하기 때문에 URLEncoder를 사용하여 저장
    Cookie cookie = new Cookie("myCookie", URLEncoder.encode("쿠키 맛 나요", "UTF-8"));
    cookie.setPath(request.getContextPath());
//    쿠키를 보관할 시간, 시간을 초(sec)로 계산함
    cookie.setMaxAge(60);
//    클라이언트에 쿠키를 전달하기 위해서 response 개체에 저장
    response.addCookie(cookie);
  %>

  <br>
  <h2>2. 쿠키 설정 직후 쿠키값 확인</h2>
  <%
    // getCookies() : 클라이언트에서 전달한 쿠키값을 모두 가져옴
//    현재는 쿠키가 만들어진 직후이기 때문에 클라이언트에서 전달한 데이터인 request에는 쿠키가 포함되지 않음
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
      for (Cookie item : cookies) {
        String cookieName = item.getName();
        String cookieValue = item.getValue();
        cookieValue = URLDecoder.decode(cookieValue, "UTF-8");
        out.print(cookieName + " : " + cookieValue + "<br>");
      }
    }
  %>

  <br>
  <h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
  <a href="CookieResult.jsp" target="_blank" class="btn btn-link">다음 페이지에서 쿠키값 확인하기</a>
</div>
</body>
</html>











