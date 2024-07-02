<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 2.
  Time: 오후 2:18
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
  <h2>MVC 패턴으로 회원 인증하기</h2>

  <div>
<%--    jsp 페이지 직접 접속 시 request 영역에 저장된 authMessage 는 읽어올 수 없음 --%>
<%--    해당 jsp 페이지에서는 authMessage에 데이터를 입력하는 setAttribute()를 실행하지 않음 --%>
<%--    서블릿에서 MemberAuth.jsp 페이지로 포워드 시에만 사용할 수 있음 --%>
    <p class="fs-3"><strong>${authMessage}</strong></p>
    <br>
    <ul class="list-group">
      <li class="list-group-item">
<%--        MemberAuth.mvc 라는 서블릿으로 접속, 파라미터값 2개 가지고 감 --%>
        <a href="/MemberAuth.mvc?id=test1&pass=1234" class="btn btn-link">회원인증 (관리자)</a>
      </li>
      <li class="list-group-item">
        <a href="/MemberAuth.mvc?id=test2&pass=1234" class="btn btn-link">회원인증 (회원)</a>
      </li>
      <li class="list-group-item">
        <a href="/MemberAuth.mvc?id=test40&pass=1234" class="btn btn-link">회원인증 (비회원)</a>
      </li>
    </ul>
  </div>
</div>

</body>
</html>











