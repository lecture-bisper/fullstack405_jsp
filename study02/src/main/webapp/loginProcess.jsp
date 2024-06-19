<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
//  클라이언트에서 전달된 데이터를 가져오기
  request.setCharacterEncoding("UTF-8");
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userEmail = request.getParameter("userEmail");
  String userName = request.getParameter("userName");
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
  <div class="row">
    <div class="col-5 mx-auto">
      <h4>사용자 ID : <%= userId %></h4>
      <h4>사용자 이름 : <%= userName %></h4>
      <h4>사용자 비밀번호 : <%= userPw %></h4>
      <h4>사용자 이메일 : <%= userEmail %></h4>
    </div>
  </div>
</div>
</body>
</html>











