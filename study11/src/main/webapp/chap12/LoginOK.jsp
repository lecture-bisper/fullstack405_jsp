<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 2.
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인 성공</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
  <h2 class="text-center">로그인 성공</h2>

  <div class="row">
    <div class="col-sm-4 mx-auto">
      <p>ID : <%=request.getAttribute("userId")%></p>
      <p>PW : <%=request.getAttribute("userPw")%></p>
      <p>Name : <%=request.getAttribute("userName")%></p>
      <a href="/chap12/LoginForm.jsp" class="btn btn-link">로그인 페이지로 이동</a>
    </div>
  </div>
</div>

</body>
</html>











