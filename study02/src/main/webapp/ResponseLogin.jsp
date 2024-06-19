<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오후 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- ResponseLogin.jsp 파일은 내부 연산만 진행하고 UI가 필요없기 때문에 HTML 코드를 모두 삭제 --%>

<%
//  클라이언트에서 전달된 데이터 받기
  String id = request.getParameter("userId");
  String pw = request.getParameter("userPw");

//  사용자가 전달한 데이터와 서버에 저장된 데이터가 같은지 비교
  if (id.equalsIgnoreCase("test1") && pw.equalsIgnoreCase("1234")) {
//    sendRedirect(URL) : response 객체에서 제공하는 멤버 메소드로 지정한 다른 페이지로 강제 이동
//    response 객체에 의해서 이동할 페이지를 클라이언트에게 요청하라고 전달함
//    클라이언트는 사용자의 입력 없이 응답받은 페이지를 열어달라고 서버에 재 요청함
//    서버는 재 요청받은 페이지를 클라이언트에게 전달함
    response.sendRedirect("./ResponseWelcome.jsp");
  }
  else {
//    getRequestDispatcher(url).forward(request, response) : sendRedirect() 와 비슷한 기능, 지정한 다른 페이지로 강제 이동
//    sendRedirect() 비슷하지만 이동할 페이지를 서버에서 직접 설정하고 서버에서 이동한 후 그 결과를 클라이언트에게 전달함
//    getRequestDispatcher(url) : 이동할 페이지 설정
//    forward(request, response) : 실제로 페이지를 이동
    request.getRequestDispatcher("./ResponseMain.jsp?loginErr=1").forward(request, response);
  }
%>











