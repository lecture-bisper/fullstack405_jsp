<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 18.
  Time: 오후 3:09
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

<%-- include 지시어 : include 를 사용 시 다른 jsp 파일을 현재 jsp 파일에 포함할 수 있음 --%>
<%-- 다른 파일의 소스 내용을 통째로 복사해서 현재 위치에 넣는다고 생각하면 됨--%>
<%-- 다른 파일에서 선언한 변수 및 메소드도 현재 파일에서 선언한 것처럼 사용할 수 있음 --%>
<%@ include file="IncludeFile.jsp" %>

<%--<%@ page import="java.time.LocalDateTime" %>--%>
<%--<%@ page import="java.time.LocalDate" %>--%>

<%--<%--%>
<%--  LocalDate today = LocalDate.now();--%>
<%--  LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);--%>
<%--%>--%>

<div class="container mt-5">
  <%
    out.println("오늘 날자 : " + today);
    out.println("<br/>");
    out.println("내일 날자 : " + tomorrow);
  %>
</div>
</body>
</html>











