<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오후 12:26
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
      <div class="col-sm-4 mx-auto border rounded rounded-3 p-3">
        <form action="MemberJoinProcess.jsp" method="post">
          <div class="my-3 form-floating">
            <input type="text" class="form-control" id="id" name="id" placeholder="사용할 ID를 입력하세요">
            <label for="id">사용할 ID를 입력하세요</label>
          </div>
          <div class="my-3 form-floating">
            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="사용할 비밀번호를 입력하세요">
            <label for="pwd">사용할 비밀번호를 입력하세요</label>
          </div>
          <div class="my-3 form-floating">
            <input type="text" class="form-control" id="name" name="name" placeholder="사용할 이름을 입력하세요">
            <label for="name">사용할 이름을 입력하세요</label>
          </div>
          <div class="my-3 d-grid gap-2">
            <button type="submit" class="btn btn-primary">회원 가입</button>
            <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>

<%-- ../ 를 사용하여 현재 디렉토리보다 한단계 상위 디렉토리를 의미함 --%>
<%-- ../ 를 사용하여 현재 위치는 chap08 디렉토리가 됨 --%>
<%-- layout/ 를 사용하여 현재 위치인 chap08 아래에 있는 layout 디렉토리를 선택 --%>
<%-- layout 디렉토리에 있는 Footer.jsp 파일을 선택 --%>
<jsp:include page="../layout/Footer.jsp"></jsp:include>

</body>
</html>











