<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 27.
  Time: 오전 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
  String pageName = "";

//  getRequestURI() : 전체 주소 중 서버 주소를 제외한 주소를 출력
  String result = request.getRequestURI();
//  lastIndexOf() : 지정한 문자열에서 지정한 문자의 위치를 알려주는 메소드
  int index = result.lastIndexOf("/") + 1;
//  substring() : 지정한 문자열에서 지정한 index 위치에서 시작하는 문자열을 잘라내어 가져옴
  result = result.substring(index);

  switch (result) {
    case "List.jsp":
      pageName = "목록";
      break;

    case "View.jsp":
      pageName = "게시글 상세";
      break;

    case "Write.jsp":
      pageName = "글쓰기";
      break;

    case "Edit.jsp":
      pageName = "글 수정";
      break;

    case "LoginForm.jsp":
      pageName = "로그인";
      break;

    case "MemberJoin.jsp":
      pageName = "회원가입";
      break;
  }
%>

<header class="px-sm-5 text-center" style="margin-top: 100px">
  <div class="container">
    <div class="rounded-3 bg-secondary bg-opacity-25 px-4 py-5">
      <h1 class="display-4">회원제 게시판 <%=pageName%> 페이지</h1>
    </div>
  </div>
</header>











