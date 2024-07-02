<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 2.
  Time: 오후 12:06
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
  <h3>한번의 매핑으로 여러가지 요청 처리하기</h3>
<%--  현재 페이지가 다시 열렸을 경우 EL 언어로 request 영역에 저장된 resultValue 라는 이름의 변수 출력 --%>
  ${resultValue}

  <ul class="list-group">
    <li class="list-group-item">URI : ${uri}</li>
    <li class="list-group-item">요청명 : ${commandStr}</li>
  </ul>
  <hr>
  <ul class="list-group">
    <li class="list-group-item">
      <a href="/join/regist.one" target="_self" class="btn btn-link">회원가입</a>
    </li>
    <li class="list-group-item">
      <a href="/login/login.one" target="_self" class="btn btn-link">로그인</a>
    </li>
    <li class="list-group-item">
      <a href="/board/freeboard.one" target="_self" class="btn btn-link">자유게시판</a>
    </li>
  </ul>
</div>

</body>
</html>











