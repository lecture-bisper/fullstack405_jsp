<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내장 객체 - request (RequestHeader.jsp)</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
  <h2>3. 요청 헤더 정보 출력하기</h2>
  <%
    Enumeration headers = request.getHeaderNames();

    while (headers.hasMoreElements()) {
      String headerName = (String) headers.nextElement();
      String headerValue = request.getHeader(headerName);
      out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br>");
    }
  %>
  <p>이 파일을 직접 실행 시 referer 정보는 출력되지 않습니다.</p>
</div>
</body>
</html>











