<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오후 4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- page 영역에 저장하기 위한 setAttribute()를 사용한 부분이 없음 --%>
<%@ page import="bitc.fullstack405.study02.dto.Person" %>

<%
  // 현재 파일은 include 지시어에 의해서 PageContextMain.jsp 파일에 포함된 파일이기 때문에 PageContextMain.jsp 파일의 page 영역에 저장한 내용을 그대로 가져와서 사용할 수 있음
  // getAttribute() 를 통해서 page 영역에 저장된 데이터를 가져옴
  int pInteger2 = (Integer) pageContext.getAttribute("pageInteger");
  String pString2 = pageContext.getAttribute("pageString").toString();
  Person pPerson2 = (Person) pageContext.getAttribute("pagePerson");
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
    <h3>include 된 영역</h3>
    <ul class="list-group">
      <li class="list-group-item">Integer 객체 : <%=pInteger2%></li>
      <li class="list-group-item">String 객체 : <%=pageContext.getAttribute("pageString")%></li>
      <li class="list-group-item">Person 객체 : <%=pPerson2.getName()%> : <%=pPerson2.getAge()%></li>
    </ul>
  </div>
</div>
</body>
</html>











