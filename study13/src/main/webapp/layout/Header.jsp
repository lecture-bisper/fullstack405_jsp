<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 4.
  Time: 오전 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  // 현재 페이지 주소를 가져옴(서버 주소는 제외)
  String fileName = request.getRequestURI();
//  전체 주소 중 가장 마지막 부분만 가져오기
  fileName = fileName.substring(fileName.lastIndexOf("/") + 1);

//  마지막 주소를 기반으로 각 페이지의 이름을 설정
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
<%--    기본 화면을 동일하게 사용하고 저장된 페이지 이름을 화면에 출력 --%>
    <h1 class="text-center m-5">MVC 게시판 ${pageName} 페이지</h1>
  </div>
</header>











