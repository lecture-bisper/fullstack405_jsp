<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - Request (RequestWebInfo.jsp)</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
  <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
  <ul class="list-group">
    <li class="list-group-item">데이터 전송 방식 : <%= request.getMethod() %></li>
    <li class="list-group-item">URL : <%= request.getRequestURL() %></li>
    <li class="list-group-item">URI : <%= request.getRequestURI() %></li>
    <li class="list-group-item">프로토콜 : <%= request.getProtocol() %></li>
    <li class="list-group-item">서버명 : <%= request.getServerName() %></li>
    <li class="list-group-item">서버 포트 : <%= request.getServerPort() %></li>
    <li class="list-group-item">클라이언트 IP 주소 : <%= request.getRemoteAddr() %></li>
    <li class="list-group-item">쿼리스트링 : <%= request.getQueryString() %></li>
    <li class="list-group-item">전송된 값 1 : <%= request.getParameter("eng") %></li>
    <li class="list-group-item">전송된 값 2 : <%= request.getParameter("han") %></li>
  </ul>
</div>
</body>
</html>











