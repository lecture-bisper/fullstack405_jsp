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
  // 게시물 목록 정보를 가져오기 위한 변수 선언
//  데이터베이스의 board 테이블과 연동되어 있는 BoardDTO 클래스 타입의 데이터를 List 넣어서 여러개의 데이터를 한번에 가져옴
  List<BoardDTO> boardList = null;

//  데이터베이스의 board 테이블을 컨트롤하는 DAO 클래스인 BoardDAO 클래스 타입의 객체를 사용
  BoardDAO dao = new BoardDAO();
//  데이터베이스 연결
  dao.dbOpen();
//  전체 게시물 정보 가져옴
  boardList = dao.selectBoardList();
//  데이터베이스 연결 종료
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

<%-- 디렉티브 태그 (지시어) 로 사용한 include 는 외부 파일을 복사하여 현재 파일에 포함 --%>
<%@ include file="layout/Header.jsp" %>
<%@ include file="layout/Menu.jsp" %>

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
<%--          가져온 전체 게시물 정보를 for 문을 사용하여 출력--%>
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

<jsp:include page="layout/Footer.jsp"></jsp:include>

</body>
</html>











