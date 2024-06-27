<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오후 12:25
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
    document.addEventListener("DOMContentLoaded", function () {
        const btnCancel = document.querySelector("#btn-cancel");
        btnCancel.addEventListener("click", function () {
            history.back();
        });
    });
  </script>
</head>
<body>

<%@ include file="../layout/Header.jsp" %>
<%@ include file="../layout/Menu.jsp" %>

<main class="container mt-5">
  <section>
    <div class="row">
      <div class="col-sm-4 mx-auto border rounded rounded-4 p-4">
        <form action="LoginProcess.jsp" method="post">
          <div class="my-3 form-floating">
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
            <label for="id">아이디를 입력하세요</label>
          </div>
          <div class="my-3 form-floating">
            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
            <label for="pwd">비밀번호를 입력하세요</label>
          </div>
          <div class="mt-3 d-grid gap-2">
            <button type="submit" class="btn btn-primary">로그인</button>
            <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
          </div>
          <div class="my-1 d-flex justify-content-end">
            <a href="MemberJoin.jsp" class="btn btn-link text-info">회원 가입</a>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>

<jsp:include page="../layout/Footer.jsp"></jsp:include>

</body>
</html>











