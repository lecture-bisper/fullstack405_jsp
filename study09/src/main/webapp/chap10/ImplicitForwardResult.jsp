<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오전 9:39
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
  <h2>ImplicitForwardResult 페이지</h2>
  <h3>각 영역에 저장된 속성 EL 언어로 읽기</h3>
  <%
    // 페이지 이동이 발생 후 page 영역에 데이터 추가
    pageContext.setAttribute("scopeValue", "직접 입력한 page영역 데이터");
  %>
  <ul class="list-group">
    <li class="list-group-item">페이지 영역 : ${pageScope.scopeValue}</li>
    <li class="list-group-item">리퀘스트 영역 : ${requestScope.scopeValue}</li>
    <li class="list-group-item">세션 영역 : ${sessionScope.scopeValue}</li>
    <li class="list-group-item">어플리케이션 영역 : ${applicationScope.scopeValue}</li>
  </ul>

  <h3>영역 지정 없이 속성 EL언어로 읽기</h3>
  <ul class="list-group">
<%--  영역 지정없이 el언어로 속성값을 읽어오면 가장 낮은 영역의 데이터를 가져옴 --%>
<%--  page > request > session > application --%>
<%--  만약 이동된 페이지에서 page 영역에 데이터를 추가하면 상위 영역의 데이터가 출력되는 것이 아니라 새로 추가한 page 영역의 데이턱가 출력됨 --%>
    <li class="list-group-item">${scopeValue}</li>
  </ul>
</div>
</body>
</html>











