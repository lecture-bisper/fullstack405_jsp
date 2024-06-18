<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%--<h1><%= "Hello World!" %></h1>--%>
<%--<br/>--%>
<%--<a href="hello-servlet">Hello Servlet</a>--%>

<div class="container mt-5">
  <ul class="list-group">
    <li class="list-group-item"><a href="Import.jsp" class="btn btn-link">page 지시어 import</a></li>
    <li class="list-group-item"><a href="Error500.jsp" class="btn btn-link">기본 예외 발생</a></li>
    <li class="list-group-item"><a href="ErrorTryCatch.jsp" class="btn btn-link">예외처리 - Try ~ catch</a></li>
    <li class="list-group-item"><a href="ErrorPage.jsp" class="btn btn-link">page 지시어 errorPage, isErrorPage</a></li>
    <li class="list-group-item"><a href="TrimWhiteSpace.jsp" class="btn btn-link">page 지시어 trimDirectiveWhitespaces</a></li>
    <li class="list-group-item"><a href="AutoFlush.jsp" class="btn btn-link">page 지시어 AutoFlush</a></li>
    <li class="list-group-item"><a href="IncludeMain.jsp" class="btn btn-link">include 지시어</a></li>
    <li class="list-group-item"><a href="ScriptElements.jsp" class="btn btn-link">jsp script 사용하기</a></li>
    <li class="list-group-item"><a href="RequestMain.jsp.jsp" class="btn btn-link">내장 객체 - request</a></li>
  </ul>
</div>
</body>
</html>