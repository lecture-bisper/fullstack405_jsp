<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오후 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 로그인 처리 페이지 (UI 없음) --%>

<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. MemberDAO를 사용하여 DB 연결 --%>
<%-- 3. DAO에서 제공하는 메소드를 사용하여 해당 id/pw를 사용하는 사용자가 있는지 확인 --%>
<%-- 4.1 사용자가 있으면 DAO를 통해서 사용자 정보 가져오기 및 DB 연결 종료 --%>
<%-- 4.2 사용자가 없으면 로그인 실패 메세지 출력, 화면 뒤로 가기 --%>
<%-- 5. 가져온 사용자 정보를 세션에 저장 후 화면 이동 --%>

<%@ page import="bitc.fullstack405.study07.util.JSFunction" %>
<%@ page import="bitc.fullstack405.study07.database.MemberDAO" %>
<%@ page import="bitc.fullstack405.study07.database.MemberDTO" %>

<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");

  MemberDAO dao = new MemberDAO();
  dao.dbOpen();

  boolean result = dao.isLogin(id, pwd);

  if (result) {
    MemberDTO member = dao.getMemberInfo(id);
    dao.dbClose();

    if (member != null) {
      session.setAttribute("userId", member.getId());
      session.setAttribute("userName", member.getName());
      session.setMaxInactiveInterval(60 * 10);
      JSFunction.alertLocation("로그인 되었습니다.", "../List.jsp", out);
    }
    else {
      JSFunction.alertBack("ID 및 PASSWORD가 맞지 않습니다.", out);
    }
  }
  else {
    dao.dbClose();
    JSFunction.alertBack("ID 및 PASSWORD가 맞지 않습니다.", out);
  }



%>









