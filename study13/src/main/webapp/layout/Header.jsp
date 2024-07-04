<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 4.
  Time: 오전 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  String fileName = request.getRequestURI();
  fileName = fileName.substring(fileName.lastIndexOf("/") + 1);

  switch (fileName) {
    case "List.jsp":
      pageContext.setAttribute("pageName", "목록");
      break;

    case "Write.jsp":
      pageContext.setAttribute("pageName", "글쓰기");
      break;

    case "View.jsp":
      pageContext.setAttribute("pageName", "상세");
      break;

    case "Edit.jsp":
      pageContext.setAttribute("pageName", "수정");
      break;

    case "Pass.jsp":
      pageContext.setAttribute("pageName", "비밀번호 확인");
      break;
  }
%>

<header class="container-fluid p-4">
  <div class="container rounded-3 bg-secondary bg-opacity-10 p-5">
    <h1 class="text-center m-5">MVC 게시판 ${pageName} 페이지</h1>
  </div>
</header>











