<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study07.util.JSFunction" %>

<%
  // 외부 파일에서 호출하여 현재 세션에 데이터가 있는지 확인
  if (session.getAttribute("userId") == null) {
//    세션 데이터가 없을 경우 메시지 출력 후 지정된 페이지로 이동
    JSFunction.alertLocation("로그인 후 이용해 주세요", "./login/LoginForm.jsp", out);
//    자바에서 return 을 만나면 해당 메소드를 종료
//    JSP 파일은 컴파일러가 _jspService() 메소드를 생성하고 해당 메소드를 실행하는 것이므로 return 을 만나면 _jspService() 메소드가 즉시 종료되어 현재 jsp 파일을 종료 시킴
    return;
  }
%>











