<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오후 12:03
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
  <h2>1. 로그인 폼</h2>
  <%
    String loginErr = request.getParameter("loginErr");
    if (loginErr != null) {
      out.print("<p class='text-danger'>로그인 실패</p>");
    }
  %>

  <form action="./ResponseLogin.jsp" method="POST">
    <div class="row">
      <div class="col-4 mx-auto">
        <div class="my-3">
          <label for="user-id" class="form-label">아이디 : </label>
          <input type="text" class="form-control" id="user-id" name="userId" placeholder="사용자 id를 입력하세요">
        </div>
        <div class="my-3">
          <label for="user-pw" class="form-label">비밀번호 : </label>
          <input type="password" class="form-control" id="user-pw" name="userPw" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="my-3 d-grid">
          <button type="submit" class="btn btn-primary">로그인</button>
        </div>
      </div>
    </div>
  </form>

  <br><hr><br>

  <h2>2. Http 응답 헤더 설정하기</h2>

  <form action="./ResponseHeader.jsp" method="GET">
    <div class="row">
      <div class="col-4 mx-auto">
        <div class="my-3">
          <label for="add-date" class="form-label"></label>
          <input type="text" class="form-control" id="add-date" name="add_date" value="2024-06-19 12:10:00">
        </div>
        <div class="my-3">
          <label for="add-int" class="form-label"></label>
          <input type="text" class="form-control" id="add-int" name="add_int" value="8282">
        </div>
        <div class="my-3">
          <label for="add-str" class="form-label"></label>
          <input type="text" class="form-control" id="add-str" name="add_str" value="홍길동">
        </div>
        <div class="my-3 d-grid gap-2">
          <button type="submit" class="btn btn-primary">응답 헤더 설정 & 출력</button>
        </div>
      </div>
    </div>
  </form>
</div>
</body>
</html>











