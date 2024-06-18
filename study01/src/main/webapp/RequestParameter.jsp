<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - request (RequestParameter.jsp)</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("id");
  String gender = request.getParameter("gender");
  String[] favo = request.getParameterValues("favo");
  String favoStr = "";
  if (favo != null) {
    for (int i = 0; i < favo.length; i++) {
      favoStr += favo[i] + " ";
    }
  }
  String intro = request.getParameter("comment").replace("\r\n", "<br/>");
%>
<div class="container mt-5">
  <ul class="list-group">
    <li class="list-group-item">아이디 : <%= id %></li>
    <li class="list-group-item">성별 : <%= gender %></li>
    <li class="list-group-item">관심사항 : <%= favoStr %></li>
    <li class="list-group-item">자기소개 : <%= intro %></li>
  </ul>
</div>
</body>
</html>











