<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 3.
  Time: 오전 10:41
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
</head>
<body>

<div class="container mt-5">
  <h3 class="text-center">다중 파일 업로드</h3>
<%--  EL언어를 사용하여 request영역에 저장된 errorMessage 변수를 출력, 있으면 출력 없으면 표시 안함 --%>
  <span class="text-danger">${errorMessage}</span>

  <div class="row">
    <div class="col-sm-4 mx-auto">
<%--      /UploadProcess.do 라는 서블릿으로 접속, 전송 방식을 multipart 타입으로 전달, file 업로드 시 필수 --%>
      <form action="/MultiUploadProcess.do" method="post" enctype="multipart/form-data">
        <div class="my-3">
          <label for="title" class="form-label">제목 : </label>
          <input type="text" class="form-control" id="title" name="title">
        </div>
        <div class="my-3">
          <label for="cate" class="form-label">카테고리(선택사항)</label>
          <div id="cate">
            <div class="form-check form-check-inline">
              <input type="checkbox" class="form-check-input" id="cate01" name="cate" value="사진" checked>
              <label for="cate01" class="form-check-label">사진</label>
            </div>
            <div class="form-check form-check-inline">
              <input type="checkbox" class="form-check-input" id="cate02" name="cate" value="과제">
              <label for="cate02" class="form-check-label">과제</label>
            </div>
            <div class="form-check form-check-inline">
              <input type="checkbox" class="form-check-input" id="cate03" name="cate" value="워드">
              <label for="cate03" class="form-check-label">워드</label>
            </div>
            <div class="form-check form-check-inline">
              <input type="checkbox" class="form-check-input" id="cate04" name="cate" value="음원">
              <label for="cate04" class="form-check-label">음원</label>
            </div>
          </div>
        </div>
        <div class="my-3">
          <label for="file" class="form-label">첨부 파일(다중첨부가능) : </label>
<%--          input 태그의 type이 file 이므로 파일을 업로드 할 수 있음 --%>
          <input type="file" class="form-control" id="file" name="attachedFile" multiple>
        </div>
        <div class="my-3 d-grid gap-2">
          <button type="submit" class="btn btn-primary">전송하기</button>
        </div>
      </form>
    </div>
  </div>
</div>

</body>
</html>











