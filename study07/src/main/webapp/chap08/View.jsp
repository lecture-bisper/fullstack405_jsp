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
  // 클라이언트에서 전달받은 지정한 게시물 번호를 가져옴
  int num = Integer.parseInt(request.getParameter("num"));

//  DAO 타입의 객체 생성 및 DB 연결
  BoardDAO dao = new BoardDAO();
  dao.dbOpen();

//  DAO를 사용하여 지정한 게시물 번호의 정보를 가져옴
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
    // $(document).ready() : jquery에서 제공하는 html 태그가 모두 로드되고 난 후 아래의 자바스크립트를 실행하는 이벤트
    // document.addEventListener("DOMContentLoaded") : 순수 자바스크립트에서 제공하는 html 태그가 모두 로드되고 난 후 아래의 자바스크립트를 실행하는 이벤트
    $(document).ready(function() {
        // on("이벤트종류", 실행할 함수) : jquery에서 제공하는 이벤트 등록 함수
        // off("이벤트종류") : jquery에서 제공하는 이벤트 삭제 함수
        // addEventListener("이벤트종류", 실행할 함수) : 순수 자바스크립트에서 제공하는 이벤트 등록 함수
        // removeEventListener("이벤트종류") : 순수 자바스크립트에서 제공하는 이벤트 삭제 함수
        $("#btn-list").on("click", function () {
            // 자바스크립트에서 제공하는 페이지 이동 명령, html의 a 태그와 같음
            location.href = "List.jsp";
        });

        // 수정 버튼 클릭
        $("#btn-edit").on("click", function () {
          //   val() : jquery에서 제공하는 input 태그의 value 값을 설정하거나 가져오는 함수
          //   $("#num") : jquery를 사용하여 id 값이 'num'인 html 태그를 선택
          var num = $("#num").val();
          // 이동할 페이지에 쿼리스트링까지 추가하여 지정한 페이지로 이동
          location.href = "Edit.jsp?num=" + num;
        });

        $("#btn-delete").on("click", function () {
          //   confirm() : 자바스크립트에서 제공하는 알림창, 사용자의 선택에 따라 true/false 값을 입력 받음
          var confirmed = confirm("삭제하시겠습니까");

          if (confirmed == true) {
              // $("#frm")[0] : jquery를 사용하여 id 속성값이 'frm'인 form 태그를 선택
              var frm = $("#frm")[0];
              // action : 선택한 form 태그의 action 속성값을 변경
              // submit() : form 태그의 submit 이벤트를 실행
              frm.action = "DeleteProcess.jsp";
              frm.submit();
          }
        });
    });
  </script>
</head>
<body>

<%@ include file="layout/Header.jsp" %>
<%@ include file="layout/Menu.jsp" %>

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

<jsp:include page="layout/Footer.jsp"></jsp:include>

</body>
</html>











