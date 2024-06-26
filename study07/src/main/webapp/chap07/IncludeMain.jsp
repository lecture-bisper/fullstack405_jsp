<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 26.
  Time: 오전 9:32
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
  // 외부 파일의 위치를 변수에 저장
  String outerPath1 = "./inc/OuterPage1.jsp";
  String outerPath2 = "./inc/OuterPage2.jsp";

//  page 영역에 데이터 저장
  pageContext.setAttribute("pAttr", "동명왕");
//  request 영역에 데이터 저장
  request.setAttribute("rAttr", "온조왕");
%>

<div class="container mt-5">
  <h2 class="text-center">지시어와 액션 태그 동작 방식 비교</h2>

  <h3 class="text-center">지시어로 페이지 포함하기</h3>
<%--  include 지시어로 외부 파일 불러오기 --%>
  <%@ include file="./inc/OuterPage1.jsp" %>
<%--  지시어에는 표현식을 사용할 수 없음 --%>
<%--  <%@ include file="<%=outerPath1%>" %>--%>
<%--  include 지시어는 외부 파일의 내용을 모두 복사하여 현재 파일에 포함시키기 때문에 외부 파일이 현재 파일과 하나의 파일이 된 것 --%>
  <p>외부 파일에 선언한 변수 : <%=newVal1%></p>

  <hr>

  <h3 class="text-center">액션 태그로 페이지 포함하기</h3>
  <jsp:include page="./inc/OuterPage2.jsp" />
<%--  액션 태그에서는 표현식 사용이 가능 --%>
  <jsp:include page="<%=outerPath2%>"></jsp:include>
<%--  액션 태그의 include 는 외부 파일로 이동하여 실행하고 결과만 가져오는 방식이기 때문에 실제로 페이지 변경이 발생하는 부분이기 때문에 외부 파일에서 선언한 변수를 사용할 수 없음 --%>
<%--  <p>외부 파일에 선언한 변수 : <%=newVal2%></p>--%>
</div>
</body>
</html>











