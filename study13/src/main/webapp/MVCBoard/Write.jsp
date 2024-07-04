<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 4.
  Time: 오전 10:36
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
        const btnCancel = document.querySelector("#btn-cancel");
        btnCancel.addEventListener("click", function() {
            history.back();
        });
    });
  </script>
</head>
<body>

<c:import url="../layout/Header.jsp"></c:import>

<main class="container mt-5">
  <section>
    <div class="row">
      <div class="col-sm">
        <form action="/mvcboard/write.do" method="post" enctype="multipart/form-data">
          <div class="row mt-3">
            <div class="col-sm">
              <div class="form-floating">
                <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
                <label for="name">이름을 입력하세요</label>
              </div>
            </div>
            <div class="col-sm">
              <div class="form-floating">
                <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력하세요">
                <label for="pass">비밀번호를 입력하세요</label>
              </div>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-sm">
              <div class="form-floating">
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
                <label for="title">제목을 입력하세요</label>
              </div>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-sm">
              <div class="form-floating">
                <textarea class="form-control" name="content" id="content" rows="5" placeholder="내용을 입력하세요" style="height: 200px"></textarea>
                <label for="content">내용을 입력하세요</label>
              </div>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-sm">
              <input type="file" class="form-control" id="upload-file" name="uploadFile">
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-sm d-flex justify-content-end">
              <button type="reset" class="btn btn-secondary me-2" id="btn-cancel">취소</button>
              <button type="submit" class="btn btn-primary">등록</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </section>
</main>

<c:import url="../layout/Footer.jsp"></c:import>

</body>
</html>











