<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 19.
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%--자바 빈즈를 import로 가져옴--%>
<%@ page import="bitc.fullstack405.study02.dto.Person " %>

<%
  // page 영역에 데이터 저장
  pageContext.setAttribute("pageInteger", 1000);
  pageContext.setAttribute("pageString", "페이지 영역의 문자열");
//  자바 클래스인 Person 클래스 타입의 객체 저장
  pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>page영역</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
  <h2>page 영역의 속성값 읽기</h2>
  <%
    // pageContext : jsp의 page 영역을 의미하는 객체, 현재 페이지 안에서만 데이터를 저장
//    setAttribute() : page 영역에 데이터 저장하기
//    getAttribute() : page 영역에 저장된 데이터 가져오기, 강제 타입 변환 필요
//    removeAttribute() : page 영역에 저장된 데이터 삭제하기
    int pInteger = (Integer) pageContext.getAttribute("pageInteger");
    String pString = (String) pageContext.getAttribute("pageString");
    Person pPerson = (Person) pageContext.getAttribute("pagePerson");
  %>
  <ul class="list-group">
    <li class="list-group-item">Integer 객체 : <%=pInteger%></li>
    <li class="list-group-item">String 객체 : <%=pString%></li>
    <li class="list-group-item">Person 객체 : <%=pPerson.getName()%>, <%=pPerson.getAge()%></li>
  </ul>

  <br><hr><br>

  <h2>include된 파일에서 page 영역 읽어오기</h2>
  <%@ include file="PageInclude.jsp"%>

  <br><hr><br>

  <h2>페이지 이동 후 page 영역 읽어오기</h2>
  <a href="PageLocation.jsp" class="btn btn-link">PageLocation.jsp 바로가기</a>
</div>
</body>
</html>











