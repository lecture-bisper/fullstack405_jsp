<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 25.
  Time: 오전 10:12
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

  <script>
    document.addEventListener("DOMContentLoaded", function() {
        // 자바스크립트에서 제공하는 1회용 타이머, 1/1000 초로 계산함
        setTimeout(function() {
            // 지정한 페이지로 이동, html의 a 태그와 같은 기능
            location.href = "LoginForm.jsp";
        }, 5000);
    });
  </script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">세션을 사용한 로그아웃</h2>

  <div>
    <%
      // 세션에 남아있는 데이터를 삭제
      session.removeAttribute("userId");
      session.removeAttribute("userName");

//      세션의 모든 데이터를 삭제
      session.invalidate();
    %>
    <p>로그아웃 되었습니다.</p>
    <p>5초 후 자동으로 Login 페이지로 이동합니다.</p>
  </div>
</div>
</body>
</html>











