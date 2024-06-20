<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오후 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  String popupMode = "on";
%>

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

  <style>
    div#popup {
        position: absolute;
        top: 100px;
        left: 50px;
        color: yellow;
        width: 400px;
        height: 100px;
        background-color: gray;
    }

    div#popup>div {
        position: relative;
        background-color: #FFFFFF;
        top: 0px;
        border: 1px solid gray;
        padding: 10px;
        color: black;
    }
  </style>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
        $("#closeBtn").on("click", function() {
            // 지정한 태그 숨김
            $("#popup").hide();
        });
    });
  </script>
</head>
<body>
<h2>팝업 메인 페이지 (ver 0.1)</h2>
<%
  for (int i = 1; i <= 10; i++) {
    out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br>");
  }

  if (popupMode.equals("on")) {
%>
<div id="popup">
  <h2 class="text-center">공지사항 팝업입니다.</h2>
  <div class="d-flex justify-content-end">
    <form name="popForm">
      <input type="checkbox" id="inactiveToday" value="1">하루 동안 열지 않음
      <input type="button" value="닫기" id="closeBtn">
    </form>
  </div>
</div>
<%
  }
%>
</body>
</html>











