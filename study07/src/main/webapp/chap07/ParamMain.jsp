<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 24. 6. 26.
  Time: 오전 11:36
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
  request.setCharacterEncoding("UTF-8");
  String pValue = "방랑시인";
%>

<div class="container mt-5">
  <h2 class="text-center">액션 태그 param 사용하기</h2>

<%--  useBean 액션 태그로 Person 클래스 타입의 객체 생성, request 영역에 저장 --%>
<%--  scope="request" 는 requst.setAttribute() 한 것과 동일함 --%>
  <jsp:useBean id="person" class="bitc.fullstack405.study07.Person" scope="request"></jsp:useBean>
<%--  setProperty를 사용하여 생성된 객체 person 에 데이터 추가 --%>
  <jsp:setProperty name="person" property="name" value="김삿갓"></jsp:setProperty>
  <jsp:setProperty name="person" property="age" value="56"></jsp:setProperty>
<%--  forward 액션 태그를 사용하여 페이지 이동 --%>
<%--  주소 뒤에 ? 를 추가하여 쿼리스트링으로 데이터 전달 --%>
  <jsp:forward page="ParamForward.jsp?param1=김병연">
<%--    param 액션 태그를 사용하여 데이터 전달 --%>
<%--    name : 데이터 전달 시 사용할 이름 --%>
<%--    value : 전달할 데이터 --%>
    <jsp:param name="param2" value="경기도 양주"></jsp:param>
<%--    표현식으로 변수의 내용을 출력도 가능 --%>
    <jsp:param name="param3" value="<%=pValue%>"></jsp:param>
  </jsp:forward>
</div>
</body>
</html>











