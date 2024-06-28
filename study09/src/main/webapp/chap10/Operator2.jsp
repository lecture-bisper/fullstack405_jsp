<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오후 12:20
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

<%@ page import="java.util.ArrayList" %>

<%
  // page 영역에 데이터 저장
//  정수 9 저장
  pageContext.setAttribute("num1", 9);
//  문자열로 만들어진 숫자 10 저장
  pageContext.setAttribute("num2", "10");

//  null 저장
  pageContext.setAttribute("nullStr", null);
//  빈문자열 저장
  pageContext.setAttribute("emptyStr", "");
//  int 타입의 배열 생성, 크기가 0
  pageContext.setAttribute("lengthZero", new Integer[0]);
//  Object 타입의 ArrayList 생성만 함
  pageContext.setAttribute("sizeZero", new ArrayList<Object>());
%>

<div class="container mt-5">
  <h3>empty 연산자</h3>
<%--  empty 연산자 : 지정한 데이터가 비었는지 아닌지를 확인하는 연산자, 비었으면 true --%>
<%--  java에서 false로 표현하는 데이터, false, 0, "", null --%>
  <p>empty nullStr : ${empty nullStr}</p>
  <p>empty emptyStr : ${empty emptyStr}</p>
  <p>empty lengthZero : ${empty lengthZero}</p>
  <p>empty sizeZero : ${empty sizeZero}</p>

  <br><hr><br>

  <h3>삼항 연산자</h3>
<%--  java에서 사용하던 삼항연산자와 같음 --%>
  <p>num1 gt num2 ? "참" : "거짓" => ${num1 gt num2 ? "num1이 크다" : "num2가 크다"}</p>

  <br><hr><br>

  <h3>null 연산</h3>
<%--  EL에서 null은 표현하지 않음 --%>
  <p>null + 10 : ${null + 10}</p>
  <p>nullStr + 10 : ${nullStr + 10}</p>
<%--  noVar 이라는 파라미터가 없음, 파라미터가 없으면 null 임--%>
  <p>param.noVar > 10 : ${param.noVar > 10}</p>
</div>
</body>
</html>











