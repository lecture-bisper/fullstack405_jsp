<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 글 수정 처리 페이지 (UI 없음) --%>
<%-- 1. 클라이언트에서 전달된 데이터 가져오기 --%>
<%-- 2. DAO를 사용하여 데이터베이스에 연결 --%>
<%-- 3. DAO에서 제공하는 메소드로 전달받은 데이터를 데이터베이스로 전달 및 수정 --%>
<%-- 4. 데이터베이스 연결 종료 --%>
<%-- 5. 데이터베이스 수정 결과에 따라 화면 이동(List.jsp, 이전 페이지) --%>

<%@ page import="bitc.fullstack405.study07.database.BoardDAO" %>
<%@ page import="bitc.fullstack405.study07.database.BoardDTO" %>
<%@ page import="bitc.fullstack405.study07.util.JSFunction" %>

<%
  request.setCharacterEncoding("UTF-8");
  int num = Integer.parseInt(request.getParameter("num"));
  String id = request.getParameter("id");
  String title = request.getParameter("title");
  String content = request.getParameter("content");

  BoardDTO board = new BoardDTO();
  board.setNum(num);
  board.setId(id);
  board.setTitle(title);
  board.setContent(content);

  BoardDAO dao = new BoardDAO();
  dao.dbOpen();
  int result = dao.updateBoard(board);
  dao.dbClose();

  if (result > 0) {
    JSFunction.alertLocation("수정했습니다.", "List.jsp", out);
  }
  else {
    JSFunction.alertBack("수정에 실패했습니다.", out);
  }
%>













