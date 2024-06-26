<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 26.
  Time: 오후 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study07.database.BoardDAO" %>
<%@ page import="bitc.fullstack405.study07.database.BoardDTO" %>

<%@ page import="java.util.List" %>

<%
  List<BoardDTO> boardList = null;

  BoardDAO dao = new BoardDAO();
  dao.dbOpen();
  boardList = dao.selectBoardList();
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
</head>
<body>

<header class="px-sm-5 text-center" style="margin-top: 100px">
  <div class="container">
    <div class="rounded-3 bg-secondary bg-opacity-25 px-4 py-5">
      <h1 class="display-4">회원제 게시판 리스트 페이지</h1>
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
        <table class="table table-hover table-striped text-center">
          <colgroup>
            <col style="width: 5%">
            <col style="width: 55%">
            <col style="width: 10%">
            <col style="width: 15%">
            <col style="width: 5%">
          </colgroup>
          <thead>
            <tr>
              <th>글번호</th>
              <th>제목</th>
              <th>작성자</th>
              <th>작성일</th>
              <th>조회수</th>
            </tr>
          </thead>
          <tbody>
            <%
              for (BoardDTO item : boardList) {
            %>
            <tr>
              <td><%=item.getNum()%></td>
              <td class="text-start">
                <a href="View.jsp?num=<%=item.getNum()%>" class="text-decoration-none"><%=item.getTitle()%></a>
              </td>
              <td><%=item.getId()%></td>
              <td><%=item.getPostDate()%></td>
              <td><%=item.getVisitCount()%></td>
            </tr>
            <%
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
    <div class="row my-3">
      <div class="col-sm">
        <div class="d-flex justify-content-end">
          <a href="Write.jsp" class="btn btn-primary">글쓰기</a>
        </div>
      </div>
    </div>
  </section>
</main>

<footer class="border-top mt-sm-5 p-sm-5">
  <p class="lead text-muted text-center">made by fullstack405</p>
</footer>
</body>
</html>











