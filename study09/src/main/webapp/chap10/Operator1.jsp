<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오후 12:08
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
<%
  int num1 = 3;
  pageContext.setAttribute("num2", 4);
  pageContext.setAttribute("num3", "5");
  pageContext.setAttribute("num4", "8");
%>

<div class="container mt-5">
  <h3>변수 선언 및 할당</h3>
<%--  EL에서는 스크립틀릿에서 선언한 변수를 사용할 수 없음 --%>
  <p>스크립틀릿에서 선언한 변수 : ${num1}</p>
  <p>page 영역에 저장한 변수 num2 : ${num2}</p>
  <p>page 영역에 저장한 변수 num3 : ${num3}</p>
  <p>page 영역에 저장한 변수 num4 : ${num4}</p>
  <p>변수 할당 및 즉시 출력 : ${num1 = 7}</p>
<%--  EL에서 변수 선언 및 데이터 할당 시 기본적으로 화면에 바로 출력 --%>
<%--  바로 출력하지 않으려면 ;'' 를 추가함 --%>
  <p>변수 할당 및 별도 출력 : ${num2 = 8;''} => ${num2}</p>

  <br>
  <hr>
  <br>

  <h3>산술 연산자</h3>
  <p>num1 + num2 : ${num1 + num2}</p>
  <p>num1 - num2 : ${num1 - num2}</p>
  <p>num1 * num2 : ${num1 * num2}</p>
  <p>num3 / num4 : ${num3 / num4}</p>
  <p>num3 div num4 : ${num3 div num4}</p>
  <p>num3 % num4 : ${num3 % num4}</p>
  <p>num3 mod num4 : ${num3 mod num4}</p>

  <br><hr><br>

  <h3>+ 연산자는 덧셈만 가능</h3>
<%--  EL 에서는 데이터 타입의 변환이 자유로움 --%>
  <p>num1 + "34" : ${num1 + "34"}</p>
<%--  + 연산자가 문자열 연결 연산자로 동작되지 않음, 오류 발생 --%>
<%--  <p>num2 + "이십" : ${num2 + "이십"}</p>--%>
<%--  <p>"삼십" + "사십" : ${"삼십" + "사십"}</p>--%>
  <p>num1 - "34" : ${num1 - "34"}</p>

  <br><hr><br>

  <h3>비교 연산자</h3>
  <p>num4 > num3 : ${num4 gt num3}</p>
  <p>num1 < num3 : ${num1 lt num3}</p>
  <p>num2 >= num4 : ${num2 ge num4}</p>
  <p>num1 == num4 : ${num1 eq num4}</p>

  <br><hr><br>

  <h3>논리 연산자</h3>
  <p>num3 <= num4 && num3 == num4 : ${num3 le num4 and num3 eq num4}</p>
  <p>num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4}</p>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>











