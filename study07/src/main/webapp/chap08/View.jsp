<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 26.
  Time: 오후 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 상세 글 보기 페이지 --%>
<%-- 1. 필요한 클래스 import --%>
<%-- 2. DAO 객체 생성 --%>
<%-- 3. 파라미터로 전달받은 데이터 가져오기 --%>
<%-- 4. DAO 에서 제공하는 메소드로 데이터 조회 --%>
<%-- 5. 가져온 데이터를 UI에 출력 --%>

<%@ page import="bitc.fullstack405.study07.database.BoardDAO" %>
<%@ page import="bitc.fullstack405.study07.database.BoardDTO" %>

<%
  int num = Integer.parseInt(request.getParameter("num"));

  BoardDAO dao = new BoardDAO();
  dao.dbOpen();

  BoardDTO board = dao.selectBoardDetail(num);

  dao.dbClose();
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <script>
    $(document).ready(function() {
        $("#btn-list").on("click", function () {
            location.href = "List.jsp";
        });

        $("#btn-edit").on("click", function () {
          var num = $("#num").val();
          location.href = "Edit.jsp?num=" + num;
        });

        $("#btn-delete").on("click", function () {
          var confirmed = confirm("삭제하시겠습니까");

          if (confirmed == true) {
              var frm = $("#frm")[0];
              frm.action = "Delete.jsp";
              frm.submit();
          }
        });
    });
  </script>
</head>
<body>

<header class="px-sm-5 text-center" style="margin-top: 100px">
  <div class="container">
    <div class="rounded-3 bg-secondary bg-opacity-25 px-4 py-5">
      <h1 class="display-4">회원제 게시판 상세보기 페이지</h1>
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
    <form id="frm" method="post">
      <div class="row my-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">번호</span>
            <input type="text" class="form-control" id="num" name="num" readonly value="<%=board.getNum()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">작성자</span>
            <input type="text" class="form-control" name="id" readonly value="<%=board.getId()%>">
          </div>
        </div>
      </div>
      <div class="row my-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">작성일</span>
            <input type="text" class="form-control" readonly value="<%=board.getPostDate()%>">
          </div>
        </div>
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption1">조회수</span>
            <input type="text" class="form-control" readonly value="<%=board.getVisitCount()%>">
          </div>
        </div>
      </div>
      <div class="row my-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption2">제목</span>
            <input type="text" class="form-control" readonly value="<%=board.getTitle()%>">
          </div>
        </div>
      </div>
      <div class="row my-3">
        <div class="col-sm">
          <div class="input-group">
            <span class="input-group-text caption2">내용</span>
            <textarea class="form-control" rows="5" readonly><%=board.getContent()%></textarea>
          </div>
        </div>
      </div>
      <div class="row my-3">
        <div class="col-sm">
          <button type="button" class="btn btn-outline-secondary" id="btn-list">목록</button>
        </div>
        <div class="col-sm d-flex justify-content-end">
          <button type="button" class="btn btn-danger" id="btn-delete">삭제</button>
          <button type="button" class="btn btn-warning ms-2" id="btn-edit">수정</button>
        </div>
      </div>
    </form>
  </section>
</main>

<footer class="border-top mt-sm-5 p-sm-5">
  <p class="lead text-muted text-center">made by fullstack405</p>
</footer>
</body>
</html>











