<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 20.
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Array" %>

<%
  // ArrayList 타입의 객체 생성
  List<String> lists = new ArrayList<>();
  lists.add("리스트");
  lists.add("컬렉션");

//  session 영역에 데이터 추가
  session.setAttribute("lists", lists);
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
  <h2>a 태그로 페이지 이동 후 session 영역의 속성 읽기</h2>
  <a href="SessionLocation.jsp?type=link" target="_blank" class="btn btn-link">SessionLocation 페이지로 이동</a>

  <br>

  <h2>forward 로 페이지 이동 후 Session 영역의 속성 읽기</h2>
  <%
    request.getRequestDispatcher("SessionLocation.jsp?type=forward").forward(request, response);
  %>
</div>
</body>
</html>











