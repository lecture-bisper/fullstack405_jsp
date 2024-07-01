<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
<%--  jstl의 set 을 사용하여 변수 선언, value 속성 대신 set의 시작 태그와 끝 태그 사이에 값을 입력해도 됨 --%>
  <c:set var="iTag">
    i 태그는 <i>기울임</i>을 표현합니다.
  </c:set>

  <h3>기본 사용</h3>
<%--  escapeXml 속성값이 기본으로 true 이기 때문에 특수기호를 모두 문자열로 출력 --%>
  <c:out value="${iTag}"></c:out>

  <hr>

  <h3>escapeXml 속성 false</h3>
<%--  escapeXml 속성이 false 이면 특수기호의 기능을 사용함 --%>
  <c:out value="${iTag}" escapeXml="false"></c:out>

  <hr>

  <h3>default 속성</h3>
<%--  value 속성에 값이 없을 경우 default 속성의 값을 대신 사용 --%>
<%--  현재 페이지를 서버에 요청 시 name 이라는 파라미터를 제공하지 않음, param.name 은 null 임 --%>
  <c:out value="${param.name}" default="이름 없음"></c:out>
<%--  빈 문자열도 값으로 처리하기 때문에 default 속성을 사용하지 않음 --%>
  <c:out value="" default="빈 문자열도 값입니다."></c:out>
</div>
</body>
</html>












