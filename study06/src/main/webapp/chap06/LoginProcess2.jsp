<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 25.
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study06.database.MemberDAO" %>
<%@ page import="bitc.fullstack405.study06.database.MemberDTO" %>

<%
  // 클라이언트에서 전달받은 사용자 id/pw를 가져옴
  request.setCharacterEncoding("UTF-8");
  String userId = request.getParameter("userId");
  String userPw = request.getParameter("userPw");

//  데이터베이스의 member 테이블의 내용을 컨트롤하는 MemberDAO 클래스 타입의 객체 생성
  MemberDAO dao = new MemberDAO();
//  데이터베이스 연결
  dao.dbOpen();

//  MemberDAO 클래스에서 제공하는 isMember() 메소드를 사용하여 전달받은 id/pw를 사용하는 사용자가 있는지 확인
  boolean result = dao.isMember(userId, userPw);

//  사용자 여부에 따라서 리다이렉트
  if (result == true) {
//    사용자가 있을 경우 MemberDAO 클래스에서 제공하는 getMemberInfo() 메소드를 사용하여 해당 사용자의 정보를 가져옴
//    가져온 결과를 MemberDTO 클래스 타입의 객체에 저장
    MemberDTO member = dao.getMemberInfo(userId);

//    데이터베이스에서 가져온 정보를 세션에 저장
    session.setAttribute("userId", member.getId());
    session.setAttribute("userName", member.getName());
    session.setAttribute("regiDate", member.getRegiDate());

//    DB 접속 종료
    dao.dbClose();
//    리다이렉트로 로그인 성공 페이지로 이동
    response.sendRedirect("LoginOK.jsp");
  }
  else {
//    사용자가 없을 경우, DB 접속 종료, 리다이렉트로 로그인 실패 페이지로 이동
    dao.dbClose();
    response.sendRedirect("LoginFail.jsp");
  }
%>










