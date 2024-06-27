<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오후 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 로그 아웃 페이지 (UI 없음) --%>

<%-- 1. 등록된 세션 정보 삭제 --%>
<%-- 2. 메시지 출력 후 목록 페이지로 이동 --%>

<%@ page import="bitc.fullstack405.study07.util.JSFunction" %>

<%
  session.removeAttribute("userId");
  session.removeAttribute("userName");

  session.invalidate();

  JSFunction.alertLocation("로그아웃하였습니다.", "../List.jsp", out);
%>











