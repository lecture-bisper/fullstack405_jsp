<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 7. 1.
  Time: 오후 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%-- jstl의 core를 사용하기 위해서 추가 --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- 컬렉션을 사용하기 위해서 추가 --%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%-- 자바 빈즈로 선언한 Person 클래스 추가 --%>
<%@ page import="bitc.fullstack405.study10.Person" %>

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

<div class="container mt-5">
  <h3>List 컬렉션 사용하기</h3>
  <%
    // 스크립틀릿의 변수로 선언, page 영역에 저장한 것이 아님
    List<Person> lists = new ArrayList<>();
    lists.add(new Person("아이유", 31));
    lists.add(new Person("유인나", 42));
    lists.add(new Person("유재석", 51));
  %>

  <div>
<%--    스크립틀릿의 변수로 선언된 List 타입의 변수 lists를 사용하기 때문에 표현식으로 출력 --%>
    <c:set var="lists" value="<%=lists%>"></c:set>
    <ul class="list-group">
      <c:forEach var="item" items="${lists}">
        <li class="list-group-item">이름 : ${item.name}, 나이 : ${item.age}</li>
      </c:forEach>
    </ul>
  </div>

  <hr>

  <h3>Map 컬렉션 사용하기</h3>
  <%
    // 스크립틀릿의 변수로 선언
    Map<String, Person> maps = new HashMap<>();
    maps.put("1st", new Person("아이유", 31));
    maps.put("2nd", new Person("유인나", 42));
    maps.put("3rd", new Person("유재석", 51));
  %>

  <div>
<%--    스크립틀릿의 변수로 선언된 Map 타입의 변수 maps를 사용하기 때문에 표현식으로 출력 --%>
    <c:set var="maps" value="<%=maps%>"></c:set>
    <ul class="list-group">
      <c:forEach var="item" items="${maps}">
<%--        map 방식이기 때문에 item.key 입력 시 key 값이 출력, item.value 입력 시 value 값이 출력--%>
<%--        item.value로 출력된 값이 Person 클래스 타입의 객체이기 때문에 해당 객체의 필드값을 출력하기 위해서 item.value.name, item.value.age 를 사용함 --%>
        <li class="list-group-item">Key => ${item.key}<br>Value => 이름 : ${item.value.name}, 나이 : ${item.value.age}</li>
      </c:forEach>
    </ul>
  </div>
</div>

</body>
</html>











