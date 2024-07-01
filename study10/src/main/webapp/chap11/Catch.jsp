<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오후 3:10
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
  <%
    int num1 = 100;
  %>
  <h4>스크립틀릿에서의 예외</h4>
  <c:catch var="errMsg">
    <%
      // 0으로 나누어서 오류 발생
      int result = num1 / 0;
    %>
  </c:catch>
  <p>예외 내용 : ${errMsg}</p>

  <hr>

  <h4>EL에서의 예외</h4>
<%--  JSTL의 set을 사용하여 변수 선언 --%>
  <c:set var="num2" value="200"></c:set>
  <c:catch var="errMsg">
<%--    EL언어에서는 문자열 연결 연산자가 없음, 문자열과 숫자를 연산할 수 없음 --%>
    ${"일" + num2}
  </c:catch>
  <p>예외 내용 : ${errMsg}</p>

  <hr>

  <h4>java 코드에서의 사용</h4>
  <%
    int result2 = 0;

    try {
      result2 = num1 / 0;
    }
    catch (Exception e) {
      out.print("<p>예외 내용 : " + e.getMessage() + "</p>");
    }
  %>
</div>

</body>
</html>











