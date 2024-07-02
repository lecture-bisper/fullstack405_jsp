<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 2.
  Time: 오후 12:44
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

  <script>
    function requestAction(frm, met) {
        if (met == 1) {
            frm.method = 'get';
        }
        else {
            frm.method = 'post';
        }
        frm.submit();
    }
  </script>
</head>
<body>

<div class="container mt-5">
  <h2>서블릿 생명주기 (Life Cycle) 메소드</h2>

  <form action="/LifeCycle.do">
    <div class="row">
      <div class="col-sm-4 mx-auto d-grid gap-2">
        <button type="button" class="btn btn-primary" onclick="requestAction(this.form, 1);">GET 방식 요청하기</button>
        <button type="button" class="btn btn-success" onclick="requestAction(this.form, 2);">POST 방식 요청하기</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>











