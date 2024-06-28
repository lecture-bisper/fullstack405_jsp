<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오전 10:12
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
  <h2>EL로 form 값 받기</h2>

  <ul class="list-group">
<%--    request.getParameter("속성명") 대신 param.속성명 사용--%>
    <li class="list-group-item">이름 : ${param.userName}</li>
    <li class="list-group-item">성별 : ${param["gender"]}</li>
    <li class="list-group-item">학력 : ${param['grade']}</li>
<%--    EL은 간편한 예외처리가 가능함 --%>
<%--  기존의 표현시 사용 시 데이터가 없는 곳을 사용하면 오류 발생 --%>
<%--  EL에서는 오류 발생 시 무시함 --%>
    <li class="list-group-item">관심사항 : ${paramValues.inter[0]} ${paramValues.inter[1]} ${paramValues.inter[2]} ${paramValues.inter[3]}</li>
  </ul>
  <br>
  <h3>기존 방식으로 출력</h3>
  <ul class="list-group">
    <li class="list-group-item">이름 : <%=request.getParameter("userName")%></li>
    <li class="list-group-item">성별 : <%=request.getParameter("gender")%></li>
    <li class="list-group-item">학력 : <%=request.getParameter("grade")%></li>
    <li class="list-group-item">관심사항 :
    <%
      String[] inters = request.getParameterValues("inter");

      for (String inter : inters) {
        out.println(inter);
      }
    %>
    </li>
  </ul>
</div>
</body>
</html>











