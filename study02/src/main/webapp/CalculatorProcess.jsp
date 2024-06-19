<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
//  getParameter() : 클라이언트에서 전달한 데이터를 request 객체가 저장하고 있음, request 객체에 저장된 내용 중 지정한 이름의 데이터를 가져오기
//  getParameterValues() : 클라이언트에서 전달한 데이터를 배열로 가져오기
//  getParameterMap() : 클라이언트에서 전달한 데이터를 Map 타입으로 가져오기
  String data1 = request.getParameter("num1");
  String data2 = request.getParameter("num2");

  int num1 = Integer.parseInt(data1);
  int num2 = Integer.parseInt(data2);
  int result = num1 + num2;
%>

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
  <h1 class="text-center">연산 결과</h1>
  <hr>
  <h3><%= num1 %> + <%= num2 %> = <%= result %></h3>
</div>
</body>
</html>











