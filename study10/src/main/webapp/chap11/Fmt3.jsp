<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

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
  <c:set var="today" value="<%=new java.util.Date()%>"></c:set>

<%--  언어 설정 값 참조 사이트 --%>
<%--  http://www.lingoes.net/en/translator/langcode.htm --%>
  <h4>로케일 설정</h4>
  <div>
    <h5>한글로 설정</h5>
    <fmt:setLocale value="ko_kr"></fmt:setLocale>
    <p><fmt:formatNumber value="10000" type="currency"></fmt:formatNumber> </p>
    <p><fmt:formatDate value="${today}"></fmt:formatDate></p>
    <hr>
    <h5>일어로 설정</h5>
    <fmt:setLocale value="ja_jp"></fmt:setLocale>
    <p><fmt:formatNumber value="10000" type="currency"></fmt:formatNumber> </p>
    <p><fmt:formatDate value="${today}"></fmt:formatDate></p>
    <hr>
    <h5>영어로 설정</h5>
    <fmt:setLocale value="en_us"></fmt:setLocale>
    <p><fmt:formatNumber value="10000" type="currency"></fmt:formatNumber> </p>
    <p><fmt:formatDate value="${today}"></fmt:formatDate></p>
    <hr>
  </div>
</div>
</body>
</html>











