<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- JSTL의 core 태그를 사용하기 위해서 추가 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- JSTL의 formatting 태그를 사용하기 위해서 추가 --%>
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
<%--  jstl로 변수 선언 --%>
  <c:set var="number1" value="12345"></c:set>

  <h4>숫자 포맷 설정 (groupingUsed=false)</h4>
<%--  기본값 --%>
  <p>콤마 O : <fmt:formatNumber value="${number1}"></fmt:formatNumber></p>
<%--  groupingUsed를 false로 변경 --%>
  <p>콤마 X : <fmt:formatNumber value="${number1}" groupingUsed="false"></fmt:formatNumber></p>

<%--  type을 통화로 설정 --%>
  <fmt:formatNumber value="${number1}" type="currency" var="printNum1"></fmt:formatNumber>
  <p>통화기호 : ${printNum1}</p>
<%--  value를 0.03으로 설정, type을 퍼센트로 설정--%>
  <fmt:formatNumber value="0.03" type="percent" var="printNum2"></fmt:formatNumber>
  <p>퍼센트 : ${printNum2}</p>

  <hr>
<%--  jstl로 변수 선언--%>
  <c:set var="number2" value="6,789.01"></c:set>

  <h4>문자열을 숫자로 변경</h4>
<%--  사용할 패턴 설정 --%>
  <fmt:parseNumber value="${number2}" pattern="00,000.00" var="printNum3"></fmt:parseNumber>
  <p>소수점까지 : ${printNum3}</p>
<%--  정수 부분만 출력하도록 설정 --%>
  <fmt:parseNumber value="${number2}" integerOnly="true" var="printNum4"></fmt:parseNumber>
  <p>정수 부분만 : ${printNum4}</p>
</div>

</body>
</html>











