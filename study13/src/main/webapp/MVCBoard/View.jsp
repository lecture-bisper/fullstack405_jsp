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
      // addEventListener() : 자바스크립트에서 제공하는 이벤트 등록 함수
    //   DOMContentLoaded : html 문서의 html 태그가 모두 로드되고 난 후 동작하는 이벤트
    document.addEventListener("DOMContentLoaded", function () {
        // querySelector() : 자바스크립트에서 제공하는 html 태그를 검색하는 함수, id, class, 태그명으로 모두 검색
        // querySelectorAll() : querySelector()와 동일한 기능이지만 검색되는 모든 태그를 다 가져옴
        // getElementById() : 자바스크립트에서 제공하는 html 태그를 검색하는 함수, id 속성값으로 검색
        const btnList = document.querySelector("#btn-list");
        const btnDelete = document.querySelector("#btn-delete");
        const btnEdit = document.querySelector("#btn-edit");

        btnList.addEventListener("click", function() {
          //   지정한 주소로 이동, get 방식으로 접속
          location.href = "/mvcboard/list.do";
        });

        btnDelete.addEventListener("click", function () {
          //   지정한 주소로 이동, 파라미터로 mode, idx를 전달함
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
<%--        서블릿에서 request 영역에 저장하여 전달한 데이터 board 를 화면에 출력--%>
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
<%--    jstl의 if 문을 사용하여 저장된 파일 정보가 있을 경우에만 아래의 내용 출력 --%>
    <c:if test="${not empty board.oFile}">
      <div class="row mt-3">
        <div class="col-sm">
          <div class="border rounded">
<%--            해당 목록을 클릭 시 /mvcboard/download.do 을 사용하는 서블릿으로 이동 --%>
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











