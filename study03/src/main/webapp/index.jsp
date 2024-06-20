<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>JSP - Hello World</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<%--<h1><%= "Hello World!" %>--%>
<%--  --%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>

<div class="container mt-5">
  <h2>chap 3 내장 객체의 영역</h2>

  <ul class="list-group">
    <li class="list-group-item"><a href="./chap3/RequestMain.jsp" target="_blank">request 영역</a></li>
    <li class="list-group-item"><a href="./chap3/SessionMain.jsp" target="_blank">session 영역</a></li>
    <li class="list-group-item"><a href="./chap3/ApplicationMain.jsp" target="_blank">application 영역</a></li>
  </ul>
  <br>
  <hr>
  <br>

  <h2>chap 4 쿠키</h2>

  <ul class="list-group">
    <li class="list-group-item"><a href="./chap04/CookieMain.jsp" target="_blank">Cookie</a></li>
    <li class="list-group-item"><a href="./chap04/PopupMain_0.1.jsp" target="_blank">Cookie없는 팝업</a></li>
    <li class="list-group-item"><a href="./chap04/PopupMain.jsp" target="_blank">Cookie를 사용한 팝업</a></li>
    <li class="list-group-item"><a href="./chap04/IdSaveMain.jsp" target="_blank">Cookie를 사용한 id 저장하기</a></li>
  </ul>

</div>

</body>
</html>











