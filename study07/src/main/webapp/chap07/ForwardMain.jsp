<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 26.
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Title</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>

<%
  // page 영역에 데이터 추가
  pageContext.setAttribute("pAttr", "김유신");
//  request 영역에 데이터 추가
  request.setAttribute("rAttr", "계백");
%>

<div class="container mt-5">
  <h2 class="text-center">액션 태그의 forward</h2>
<%--  RequestDispatcher의 forward 메소드와 액션 태그의 forward의 기능은 동일하지만 jsp 파일에서 액션 태그를 사용 하는 것이 가독성이 더 높기 때문에 액션 태그의 forward를 사용함 --%>
<%--  액션 태그의 forward 사용 --%>
  <jsp:forward page="ForwardSub.jsp"></jsp:forward>
<%--  RequestDispatcher의 forward 메소드 사용 --%>
<%--  <%--%>
<%--    request.getRequestDispatcher("ForwardSub.jsp").forward(request, response);--%>
<%--  %>--%>

  <h2 class="text-center">a 태그로 이동 시</h2>
  <a href="ForwardSub.jsp" target="_blank" class="btn btn-link">이동</a>
</div>
</body>
</html>











