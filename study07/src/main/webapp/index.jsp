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
  <h2 class="text-center">chap07</h2>

  <ul class="list-group">
    <li class="list-group-item"><a href="chap07/IncludeMain.jsp" target="_blank" class="btn btn-link">액션태그 include</a></li>
    <li class="list-group-item"><a href="chap07/ForwardMain.jsp" target="_blank" class="btn btn-link">액션태그 forward</a></li>
    <li class="list-group-item"><a href="chap07/UseBeanMain.jsp" target="_blank" class="btn btn-link">액션태그 useBean, getProperty, setProperty</a></li>
    <li class="list-group-item"><a href="chap07/UseBeanForm.jsp" target="_blank" class="btn btn-link">액션태그 useBean2, getProperty2, setProperty2</a></li>
    <li class="list-group-item"><a href="chap07/ParamMain.jsp" target="_blank" class="btn btn-link">액션태그 param</a></li>
  </ul>

  <hr>

  <h2 class="text-center">chap08</h2>

  <ul class="list-group">
    <li class="list-group-item"><a href="chap08/List.jsp" target="_blank" class="btn btn-link">게시판 만들기</a></li>
  </ul>
</div>
</body>
</html>