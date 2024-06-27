<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오후 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 회원 가입 처리 페이지 (UI 없음) --%>
<%-- 1. 클라이언트에서 전달받은 데이터 가져오기 --%>
<%-- 2. DAO(MemberDAO)를 사용하여 데이터베이스 연결 --%>
<%-- 3. DAO에서 제공하는 메소드를 사용하여 사용자 추가 --%>
<%-- 4. DB 연결 종료, 결과에 따라 화면 이동 --%>

<%@ page import="bitc.fullstack405.study07.database.MemberDAO" %>
<%@ page import="bitc.fullstack405.study07.database.MemberDTO" %>
<%@ page import="bitc.fullstack405.study07.util.JSFunction" %>

<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");
  String name = request.getParameter("name");

  MemberDTO member = new MemberDTO();
  member.setId(id);
  member.setPass(pwd);
  member.setName(name);

  MemberDAO dao = new MemberDAO();
  dao.dbOpen();
  int result = dao.insertMember(member);
  dao.dbClose();

  if (result > 0) {
    JSFunction.alertLocation("회원 가입에 성공했습니다.", "LoginForm.jsp", out);
  }
  else {
    JSFunction.alertBack("회원 가입에 실패했습니다.", out);
  }
%>









