<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 26.
  Time: 오후 12:12
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

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <script>
      $(document).ready(function() {
          $("#btn-list").on("click", function () {
              location.href = "List.jsp";
          });
      });
  </script>

</head>
<body>

<header class="px-sm-5 text-center" style="margin-top: 100px">
  <div class="container">
    <div class="rounded-3 bg-secondary bg-opacity-25 px-4 py-5">
      <h1 class="display-4">회원제 게시판 글쓰기 페이지</h1>
    </div>
  </div>
</header>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <div class="container-fluid">
    <a href="List.jsp" class="navbar-brand">게시판</a>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a href="#" class="nav-link">메뉴 1</a>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link">메뉴 2</a>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link">메뉴 3</a>
      </li>
    </ul>
    <div class="ms-auto">
      <a href="#" class="btn btn-outline-success">로그인</a>
    </div>
  </div>
</nav>

<main class="container mt-5">
  <section>
    <div class="row my-3">
      <div class="col-sm">
        <form action="WriteProcess.jsp" method="post">
          <div class="my-3">
            <label for="title" class="form-label">제목 : </label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
          </div>
          <div class="my-3">
            <label for="id" class="form-label">아이디 : </label>
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
          </div>
          <div class="my-3">
            <label for="content" class="form-label">내용 : </label>
            <textarea class="form-control" name="content" id="content" rows="5" placeholder="내용을 입력하세요"></textarea>
          </div>
          <div class="my-3 clearfix">
            <button type="reset" class="btn btn-outline-secondary float-start" id="btn-list">목록</button>
            <button type="submit" class="btn btn-primary float-end">작성 완료</button>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>

<footer class="border-top mt-sm-5 p-sm-5">
  <p class="lead text-muted text-center">made by fullstack405</p>
</footer>
</body>
</html>











