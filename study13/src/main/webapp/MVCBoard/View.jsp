<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 4.
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
    document.addEventListener("DOMContentLoaded", function () {
        const btnList = document.querySelector("#btn-list");
        const btnDelete = document.querySelector("#btn-delete");
        const btnEdit = document.querySelector("#btn-edit");

        btnList.addEventListener("click", function() {
          location.href = "/mvcboard/list.do";
        });

        btnDelete.addEventListener("click", function () {
          location.href = "/mvcboard/pass.do?mode=delete&idx=${board.idx}";
        });

        btnEdit.addEventListener("click", function () {
          location.href = "/mvcboard/pass.do?mode=update&idx=${board.idx}";
        });
    });
  </script>
</head>
<body>

<c:import url="../layout/Header.jsp"></c:import>

<main class="container mt-5">
  <section>
    <div class="row mt-3">
      <div class="col-sm">
        <input type="text" class="form-control" id="title" name="title" value="${board.title}" readonly>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-sm">
        <input type="text" class="form-control" id="name" name="name" value="${board.name}" readonly>
      </div>
      <div class="col-sm">
        <input type="text" class="form-control" id="post-date" name="postDate" value="${board.postDate}" readonly>
      </div>
      <div class="col-sm">
        <input type="text" class="form-control" id="visit-count" name="visitCount" value="${board.visitCount}" readonly>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-sm">
        <textarea class="form-control" id="content" name="content" rows="5" readonly>${board.content}</textarea>
      </div>
    </div>
    <c:if test="${not empty board.oFile}">
      <div class="row mt-3">
        <div class="col-sm">
          <div class="border rounded">
            <a href="/mvcboard/download.do?idx=${board.idx}&ofile=${board.oFile}&sfile=${board.sFile}" class="btn btn-link">${board.oFile} (다운로드 수 : ${board.downCount})</a>
          </div>
        </div>
      </div>
    </c:if>
    <div class="row mt-3">
      <div class="col-sm">
        <button type="button" class="btn btn-secondary" id="btn-list">목록</button>
      </div>
      <div class="col-sm d-flex justify-content-end">
        <button type="button" class="btn btn-danger me-2" id="btn-delete">삭제</button>
        <button type="button" class="btn btn-warning" id="btn-edit">수정</button>
      </div>
    </div>
  </section>
</main>

<c:import url="../layout/Footer.jsp"></c:import>

</body>
</html>











