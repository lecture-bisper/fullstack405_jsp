<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
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
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">폼값 전송하기</h2>
  <div class="row">
    <div class="col-sm-4 mx-auto">
      <form action="FormResult.jsp" method="post">
        <div class="my-3">
          <label for="user-name" class="form-label">이름 : </label>
          <input type="text" class="form-control" id="user-name" name="userName" placeholder="이름을 입력하세요">
        </div>
        <div class="my-3">
          <label class="form-label">성별 : </label>
          <div class="form-check">
            <input type="radio" class="form-check-input" id="gender1" name="gender" value="남성" checked>
            <label for="gender1" class="form-check-label">남성</label>
          </div>
          <div class="form-check">
            <input type="radio" class="form-check-input" id="gender2" name="gender" value="여성">
            <label for="gender2" class="form-check-label">여성</label>
          </div>
        </div>
        <div class="my-3">
          <label for="grade">학력 : </label>
          <select class="form-control" name="grade" id="grade">
            <option value="ele">초딩</option>
            <option value="mid">중딩</option>
            <option value="high">고딩</option>
            <option value="uni" selected>대딩</option>
          </select>
        </div>
        <div class="my-3">
          <label class="form-label">관심분야 : </label>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="inter1" name="inter" value="pol">
            <label for="inter1" class="form-check-label">정치</label>
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="inter2" name="inter" value="eco">
            <label for="inter2" class="form-check-label">경제</label>
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="inter3" name="inter" value="ent">
            <label for="inter3" class="form-check-label">연예</label>
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="inter4" name="inter" value="spo">
            <label for="inter4" class="form-check-label">운동</label>
          </div>
        </div>
        <div class="my-3 d-grid gap-2">
          <button type="submit" class="btn btn-primary">전송하기</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>











