<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오전 10:45
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
  <h1 class="text-center">JSP로 만든 계산기</h1>

  <form action="CalculatorProcess.jsp" method="GET">
    <div class="row">
      <div class="col-4 mx-auto">
        <div class="my-3">
          <label for="num1" class="form-label">첫번째 숫자 : </label>
          <input type="text" class="form-control" id="num1" name="num1" placeholder="첫번째 숫자를 입력하세요">
        </div>
        <div class="my-3">
          <label for="num2" class="form-label">두번째 숫자 : </label>
          <input type="text" class="form-control" id="num2" name="num2" placeholder="두번째 숫자를 입력하세요">
        </div>
        <div class="my-3 d-grid gap-2">
          <button type="submit" class="btn btn-primary">계산</button>
        </div>
      </div>
    </div>
  </form>
</div>
</body>
</html>











