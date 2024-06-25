<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 25.
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

<%
  // 페이지 이동 후 세션 영역에 저장된 데이터를 가져옴
  String userId = (String)session.getAttribute("userId");
  String userName = (String)session.getAttribute("userName");
%>
<div class="container mt-5">
  <h2 class="text-center">세션을 사용한 로그인 성공</h2>

  <div class="d-flex justify-content-end">
<%--    가져온 데이터 화면에 출력 --%>
    <p class="me-3"><%=userName%>(<%=userId%>) 님 반갑습니다.</p>
    <a href="Logout.jsp" class="btn btn-info">로그 아웃</a>
  </div>
</div>
</body>
</html>











