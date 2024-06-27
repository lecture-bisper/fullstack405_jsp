<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오전 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 게시글 삭제 페이지 --%>
<%-- UI 필요없음 --%>

<%-- 1. 클라이언트에서 전달한 데이터 가져오기 --%>
<%-- 2. 데이터베이스 연결(DAO) --%>
<%-- 3. DAO에서 제공하는 메소드를 사용하여 데이터베이스에서 삭제 --%>
<%-- 4. 데이터베이스 연결 종료 및 결과 확인 --%>
<%-- 5. 리다이렉트 --%>

<%@ page import="bitc.fullstack405.study07.database.BoardDAO" %>
<%@ page import="bitc.fullstack405.study07.util.JSFunction" %>

<%-- 게시물 삭제는 회원만 가능하기 때문에 세션에 로그인 정보가 있는지 확인 --%>
<jsp:include page="./login/LoginCheck.jsp"></jsp:include>

<%
  int num = Integer.parseInt(request.getParameter("num"));

  BoardDAO dao = new BoardDAO();
  dao.dbOpen();

  int result = dao.deleteBoard(num);

  dao.dbClose();

  if (result > 0) {
    JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
  }
  else {
    JSFunction.alertBack("삭제에 실패했습니다.", out);
  }
%>









