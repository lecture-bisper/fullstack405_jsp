<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - RequestMain.jsp</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
  <h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
  <a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">GET 방식 전송</a><br>

  <form action="RequestWebInfo.jsp" method="POST">
    <div class="my-3">
      <label for="eng" class="form-label">영어 : </label>
      <input type="text" class="form-control" id="eng" name="eng" value="Bye!!">
    </div>
    <div class="my-3">
      <label for="han" class="form-label">한글 : </label>
      <input type="text" class="form-control" id="han" name="han" value="잘 가!!">
    </div>
    <button type="submit" class="btn btn-primary">확인</button>
  </form>

  <h2>2. 클라이언트의 요ㅛ청 매개변수 읽기</h2>
  <form action="RequestParameter.jsp" method="POST">
    <div class="my-3">
      <label for="id" class="form-label">아이디 : </label>
      <input type="text" class="form-control" id="id" name="id">
    </div>
    <div class="my-3">
      <label class="form-label">성별 : </label>
      <div class="form-check form-check-inline">
        <input type="radio" class="form-check-input" id="gender-man" name="gender" value="man">
        <label for="gender-man" class="form-check-label">남자</label>
      </div>
      <div class="form-check form-check-inline">
        <input type="radio" class="form-check-input" id="gender-woman" name="gender" value="woman">
        <label form="gender-woman" class="form-check-label">여자</label>
      </div>
    </div>
    <div class="my-3">
      <label class="form-label">관심사항 : </label>
      <div class="form-check form-check-inline">
        <input type="checkbox" class="form-check-input" id="favo1" name="favo" value="eco">
        <label for="favo1" class="form-check-label">경제</label>
      </div>
      <div class="form-check form-check-inline">
        <input type="checkbox" class="form-check-input" id="favo2" name="favo" value="pol">
        <label for="favo2" class="form-check-label">정치</label>
      </div>
      <div class="form-check form-check-inline">
        <input type="checkbox" class="form-check-input" id="favo3" name="favo" value="ent">
        <label for="favo3" class="form-check-label">연예</label>
      </div>
    </div>
    <div class="my-3">
      <label for="comment" class="form-label">자기소개 : </label>
      <textarea rows="5" class="form-control" id="comment" name="comment"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">확인</button>
  </form>
  <h2>3. HTTP 요청 헤더 정보 읽기</h2>
  <a href="RequestHeader.jsp" class="btn btn-link">요청 헤더 정보 읽기</a>
</div>
</body>
</html>











