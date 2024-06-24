<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<%--<h1><%= "Hello World!" %>--%>
<%--</h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>
<div class="container mt-5">
  <h2>chap 5</h2>
  <ul class="list-group">
    <li class="list-group-item"><a href="ConnectionTest.jsp" target="_blank" class="btn btn-link">DB 접속 테스트</a></li>
    <li class="list-group-item"><a href="./chap05/Insert.jsp" target="_blank" class="btn btn-link">insert 사용</a></li>
    <li class="list-group-item"><a href="./chap05/Select.jsp" target="_blank" class="btn btn-link">select 사용</a></li>
    <li class="list-group-item"><a href="./chap05/Update.jsp" target="_blank" class="btn btn-link">update 사용</a></li>
    <li class="list-group-item"><a href="./chap05/Delete.jsp" target="_blank" class="btn btn-link">delete 사용</a></li>
    <li class="list-group-item"><a href="./chap05/Insert02.jsp" target="_blank" class="btn btn-link">PreparedStatement로 insert</a></li>
    <li class="list-group-item"><a href="./chap05/Select02.jsp" target="_blank" class="btn btn-link">PreparedStatement로 select</a></li>
    <li class="list-group-item"><a href="./chap05/Select02.jsp" target="_blank" class="btn btn-link">PreparedStatement로 update</a></li>
    <li class="list-group-item"><a href="./chap05/Select02.jsp" target="_blank" class="btn btn-link">PreparedStatement로 delete</a></li>
    <li class="list-group-item"><a href="./chap05/PreparedStatementEx.jsp" target="_blank" class="btn btn-link">PreparedStatement 재활용하기</a></li>
    <li class="list-group-item"><a href="./chap05/ConnectionTest1.jsp" target="_blank" class="btn btn-link">기존 JSP 방식 DB 접속</a></li>
    <li class="list-group-item"><a href="./chap05/ConnectionTest2.jsp" target="_blank" class="btn btn-link">DB 접속용 Java Class로 DB 접속</a></li>
    <li class="list-group-item"><a href="./chap05/ConnectionTest3.jsp" target="_blank" class="btn btn-link">web.xml에서 DB 접속 정보를 가져와서 DB 접속</a></li>
    <li class="list-group-item"><a href="./chap05/ConnectionPoolEx.jsp" target="_blank" class="btn btn-link">커넥션 풀로 DB 접속하기</a></li>
  </ul>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>