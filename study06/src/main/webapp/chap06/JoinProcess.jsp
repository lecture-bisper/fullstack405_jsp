<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 25.
  Time: 오후 2:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study06.database.MemberDAO" %>
<%@ page import="bitc.fullstack405.study06.database.MemberDTO" %>

<%-- 1. 클라이언트에서 전달된 데이터 가져오기 --%>
<%
  request.setCharacterEncoding("UTF-8");
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");
  String userName = request.getParameter("userName");
%>

<%-- 2. 데이터베이스 연결 --%>
<%
  MemberDAO dao = new MemberDAO();
  dao.dbOpen();

//  3. 데이터베이스에 sql문 전달
//  boolean result = dao.insertMember(userId, userPw, userName);
  MemberDTO member = new MemberDTO();
  member.setId(userId);
  member.setName(userName);
  member.setPass(userPw);

  boolean result = dao.insertMember(member);
  dao.dbClose();

//  4. 결과를 받은 후 리다이렉트
  if (result) {
    String script = "<script>";
    script += "alert('회원 가입되었습니다.');";
    script += "location.href = 'LoginForm2.jsp';";
    script += "</script>";
    out.println(script);
  }
  else {
    String script = "<script>";
    script += "alert('회원 가입 중 오류가 발생했습니다.');";
    script += "history.back();";
    script += "</script>";
    out.println(script);
  }
%>










