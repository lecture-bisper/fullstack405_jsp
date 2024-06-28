<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 28.
  Time: 오후 4:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="bitc.fullstack405.study09.Person" %>

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
  // List 타입의 데이터 생성
  List<Person> list = new ArrayList<>();
  list.add(new Person("아이유", 31));
  list.add(new Person("유인나", 42));
%>

<%--set을 사용하여 List 타입의 데이터를 request 영역에 저장--%>
<c:set var="personList" value="<%=list%>" scope="request"></c:set>

<div class="container mt-5">
  <h3>List 사용하기</h3>
  <ul class="list-group">
<%--    request 영역에 저장된 personList 라는 이름의 List 데이터를 가져옴 --%>
<%--    List는 배열과 같이 index 가 있으므로 [index]로 접근 가능--%>
    <li class="list-group-item">이름 : ${requestScope.personList[0].name}</li>
    <li class="list-group-item">나이 : ${personList[0].age}</li>
  </ul>

  <br><hr><br>

  <h3>Map 사용하기</h3>
  <%
    // Map 타입의 데이터 생성
    Map<String, Person> map = new HashMap<>();
    map.put("personArgs1", new Person("아이유", 31));
    map.put("personArgs2", new Person("유인나", 42));
  %>

<%--  Map 타입의 데이터를 request 영역에 저장--%>
  <c:set var="personMap" value="<%=map%>" scope="request"></c:set>

  <ul class="list-group">
    <li class="list-group-item">이름 : ${requestScope.personMap.personArgs2.name}</li>
    <li class="list-group-item">나이 : ${personMap.personArgs2.age}</li>
  </ul>
</div>
</body>
</html>











