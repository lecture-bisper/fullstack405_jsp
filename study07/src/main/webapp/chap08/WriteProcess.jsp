<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 26.
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 글쓰기 처리 페이지(UI X) --%>
<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. 데이터베이스로 전달하기 위한 DTO 객체 생성 및 데이터 저장 --%>
<%-- 3. DAO 객체 생성 및 DB 연결 --%>
<%-- 4. DAO에서 제공하는 insertBoard() 메소드 실행 --%>
<%-- 5. DB 연결 해제 및 리다이렉트(List.jsp) --%>

<%@ page import="bitc.fullstack405.study07.database.BoardDTO" %>
<%@ page import="bitc.fullstack405.study07.database.BoardDAO" %>

<%
  request.setCharacterEncoding("UTF-8");
  String title = request.getParameter("title");
  String id = request.getParameter("id");
  String content = request.getParameter("content");

  BoardDTO board = new BoardDTO();
  board.setTitle(title);
  board.setId(id);
  board.setContent(content);

  BoardDAO dao = new BoardDAO();
  dao.dbOpen();

  int result = dao.insertBoard(board);

  dao.dbClose();

  if (result > 0) {
    response.sendRedirect("List.jsp");
  }
  else {
    String script = "<script>";
    script += "alert('게시글을 등록하지 못하였습니다.');";
    script += "history.back();";
    script += "</script>";
    out.println(script);
  }
%>










