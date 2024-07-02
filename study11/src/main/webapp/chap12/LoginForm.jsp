<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 2.
  Time: 오전 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인 페이지</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">로그인 페이지</h2>

  <div class="row mt-4">
    <div class="col-sm-4 mx-auto">
<%--      <form action="./LoginProcess.jsp" method="post">--%>
      <form action="/LoginProcess.do" method="post">
        <div class="my-3">
          <label for="user-id" class="form-label">사용
            자 ID : </label>
          <input type="text" class="form-control" id="user-id" name="userId" placeholder="사용자 ID를 입력하세요">
        </div>
        <div class="my-3">
          <label for="user-pw" class="form-label">사용자 비밀번호 : </label>
          <input type="password" class="form-control" id="user-pw" name="userPw" placeholder="사용자 비밀번호를 입력하세요">
        </div>
        <div class="my-3 d-grid gap-2">
          <button type="submit" class="btn btn-primary">로그인</button>
          <button type="reset" class="btn btn-secondary">취소</button>
        </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>











