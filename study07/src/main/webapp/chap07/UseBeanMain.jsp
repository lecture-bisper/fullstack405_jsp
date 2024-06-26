<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 26.
  Time: 오전 10:38
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

<div class="container mt-5">
  <h2 class="text-center">액션태그 useBean</h2>
  <h3 class="text-center">자바빈즈 생성하기</h3>

<%--  useBean : 자바 클래스의 객체를 대신 생성하는 액션 태그 --%>
<%--  id : 자바 클래스 타입의 객체명을 지정 --%>
<%--  class : 객체를 생성할 자바 클래스의 전체 경로(패키지명 포함) --%>
<%--  scope : 생성된 객체를 저장할 영역, 주로 page(기본값), request를 사용 --%>
  <jsp:useBean id="person" class="bitc.fullstack405.study07.Person" scope="request"></jsp:useBean>

  <h3 class="text-center">setProperty 액션 태그 사용</h3>
<%--  setProperty : useBean 액션 태그를 통해서 생성된 자바 클래스 타입의 객체에 데이터를 저장하는 액션 태그 --%>
<%--  name : useBean 액션 태그로 생성된 자바 클래스 타입의 객체명을 지정 --%>
<%--  property : 지정한 객체가 가지고 있는 필드명 --%>
<%--  value : 지정한 객체가 가지고 있는 필드에 저장할 데이터 --%>
  <jsp:setProperty name="person" property="name" value="임꺽정"></jsp:setProperty>
  <jsp:setProperty name="person" property="age" value="41"></jsp:setProperty>

  <h3 class="text-center">getProperty 액션 태그 사용</h3>
  <ul class="list-group">
<%--    getProperty : useBean 액션 태그를 통해서 생성된 자바 클래스 타입의 객체에서 데이터를 출력하는 액션 태그--%>
<%--    name : useBean 액션 태그로 생성된 자바 클래스 타입의 객체명을 지정 --%>
<%--    property : 지정한 객체가 가지고 있는 필드명 --%>
    <li class="list-group-item">이름 : <jsp:getProperty name="person" property="name"></jsp:getProperty></li>
    <li class="list-group-item">나이 : <jsp:getProperty name="person" property="age"></jsp:getProperty></li>
  </ul>

  <hr>

  <%--  액션 태그 useBean을 사용하지 않은 형태 --%>
  <%@ page import="bitc.fullstack405.study07.Person" %>
  <%
    Person p = new Person();

    p.setName("임꺽정");
    p.setAge(41);
  %>

  <ul class="list-group">
    <li class="list-group-item">이름 : <%=p.getName()%></li>
    <li class="list-group-item">나이 : <%=p.getAge()%></li>
  </ul>
</div>
</body>
</html>











