<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ page import="bitc.fullstack405.study02.dto.Person" %>

<%
  // a 태그를 통해서 페이지가 이동한 파일
//  PageContextMain.jsp 파일의 page 영역에 저장한 내용을 가져올 수 없음
//  getAttribute() 를 통해서 데이터를 가져오면 모두 null 이 출력됨
  Object pInteger3 = pageContext.getAttribute("pageInteger");
  Object pString3 = pageContext.getAttribute("pageString");
  Object pPerson3 = pageContext.getAttribute("pagePerson");
%>

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
<div class="container mt-4">
  <div class="border border-2 rounded-3">
    <h3>이동 후 page 영역의 속성값 읽기</h3>
    <ul class="list-group">
      <li class="list-group-item">Integer 객체 : <%=(pInteger3 == null) ? "값없음" : pInteger3%></li>
      <li class="list-group-item">String 객체 : <%=(pString3 == null) ? "값없음" : pString3%></li>
      <li class="list-group-item">Person 객체 : <%=(pPerson3 == null) ? "값없음" : ((Person)pPerson3).getName()%></li>
    </ul>
  </div>
</div>
</body>
</html>











