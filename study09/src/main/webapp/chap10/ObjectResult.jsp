<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study09.Person" %>

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
  <h2 class="text-center">영역을 통해 전달된 객체 읽기</h2>

  <ul class="list-group">
<%--    영역 이름없이 저장된 이름으로 바로 출력, --%>
    <li class="list-group-item">Person 객체 => 이름 : ${personObj.name}, 나이 : ${personObj.age}</li>
    <li class="list-group-item">String 객체 => ${requestScope.stringObj}</li>
    <li class="list-group-item">Integer 객체 => ${integerObj}</li>
  </ul>
  <br>

  <h2 class="text-center">매개변수로 전달된 값 읽기</h2>

  <ul class="list-group">
<%--    EL에서 간단한 연산이 가능함 --%>
<%--    EL 표현식 안에서 데이터를 출력 후 연산을 진행한 결과를 화면에 출력 --%>
    <li class="list-group-item">${param.firstNum + param['secondNum']}</li>
<%--  EL 표현식으로 화면에 출력을 먼저 진행, 중간의 + 기호는 연산자가 아닌 그냥 화면에 출력된 문자열 --%>
    <li class="list-group-item">${param.firstNum} + ${param["secondNum"]}</li>
  </ul>
</div>

</body>
</html>











