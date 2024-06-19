<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
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
  <h1 class="text-center">회원 가입</h1>
  <form action="loginProcess.jsp" method="POST">
    <div class="row">
      <div class="col-4 mx-auto">
        <div class="my-3">
          <label for="user-id" class="form-label">USER ID : </label>
          <input type="text" class="form-control" id="user-id" name="userId" placeholder="사용자 ID를 입력하세요">
        </div>
        <div class="my-3">
          <label for="user-pw" class="form-label">USER Password : </label>
          <input type="password" class="form-control" id="user-pw" name="userPw" placeholder="사용자 비밀번호를 입력하세요">
        </div>
        <div class="my-3">
          <label for="user-email" class="form-label">USER Email : </label>
          <input type="email" class="form-control" id="user-email" name="userEmail" placeholder="이메일을 입력하세요">
        </div>
        <div class="my-3">
          <label for="user-name" class="form-label">USER Name : </label>
          <input type="text" class="form-control" id="user-name" name="userName" placeholder="이름을 입력하세요">
        </div>
        <div class="my-3 d-grid gap-2">
          <button type="submit" class="btn btn-primary">확인</button>
          <button type="reset" class="btn btn-secondary">취소</button>
        </div>
      </div>
    </div>
  </form>
</div>
</body>
</html>











